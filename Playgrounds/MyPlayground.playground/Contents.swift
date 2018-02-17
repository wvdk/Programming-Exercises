
import UIKit
import AVFoundation
import CoreGraphics

enum Thumbnail: UIImage {
    
    case big: UIImage
    case small: UIImage

//    var url: URL {
//        return documentDirectory().appendingPathComponent("octi-thumbnail-\(self.kind.rawValue)-\(self.id).\(self.kind.fileExtension)")
//    }
    
//    func calculateMD5() throws -> String {
//        return try md5(ofFileAt: self.url) ?? UUID().uuidString
//    }
    
}

enum PreviewVideo {
    
    case big, small
    
}

enum KindOfThumbnail: String {
    case thumbnail, thumbnailSmall, preview, previewSmall
    
    var size: CGSize {
        switch self {
        case .thumbnailSmall, .previewSmall:
            return size(forWidth: 400)
        case .thumbnail, .preview:
            return size(forWidth: 720)
        }
    }
    
    private func size(forWidth width: CGFloat) -> CGSize {
        let ratio: CGFloat = 1280 / 720
        return CGSize(width: width, height: width * ratio)
    }
    
    var mimeType: String {
        switch self {
        case .thumbnail, .thumbnailSmall:
            return "image/jpeg"
        case .preview, .previewSmall:
            return "video/quicktime"
        }
    }
    
    var fileExtension: String {
        switch self {
        case .thumbnail, .thumbnailSmall:
            return "jpeg"
        case .preview, .previewSmall:
            return "mov"
        }
    }
}

typealias Thumbnails = (thumbnail: Thumbnail, thumbnailSmall: Thumbnail, preview: Thumbnail, previewSmall: Thumbnail)

class ThumbnailGenerator {
    
    static let shared = ThumbnailGenerator()
    
    /// A dictionary of temporaryID / Thumbnails key value pairs
    var cache: [String: Thumbnail] = [:]
    var tempFiles: [URL] = []
    
    func thumbnailsFor(video originalVideoUrl: URL, usingTemporaryID temporaryID: String, videoInfo: VideoInfo?, completion: @escaping (_ success: Bool, _ thumbnails: Thumbnails?) -> Void) {
        let asset = AVURLAsset(url: originalVideoUrl)
        
        let largeThumbnail = Thumbnail(kind: .thumbnail, id: temporaryID)
        let smallThumbnail = Thumbnail(kind: .thumbnailSmall, id: temporaryID)
        let largePreview = Thumbnail(kind: .preview, id: temporaryID)
        let smallPreview = Thumbnail(kind: .previewSmall, id: temporaryID)
        
        // Generate thumbnail images
        
        let generator = AVAssetImageGenerator(asset: asset)
        generator.maximumSize = KindOfThumbnail.preview.size
        
        let smallGenerator = AVAssetImageGenerator(asset: asset)
        smallGenerator.maximumSize = KindOfThumbnail.previewSmall.size
        
        let previewStartTime: Double = 1.0
        let previewEndTime: Double = 2.0
        
        let time = CMTimeMakeWithSeconds(0.5 * (previewEndTime - previewStartTime) + previewStartTime, Int32(NSEC_PER_SEC))
        
        guard let largeCGImage = try? generator.copyCGImage(at: time, actualTime: nil),
            let smallCGImage = try? smallGenerator.copyCGImage(at: time, actualTime: nil) else {
                Log.w("could not copy image at time \(time.seconds)")
                return completion(false, nil)
        }
        
        for thumbnail in [largeThumbnail, smallThumbnail] {
            var image: UIImage!
            if thumbnail.kind == .thumbnail {
                image = UIImage(cgImage: largeCGImage)
            } else if thumbnail.kind == .thumbnailSmall {
                image = UIImage(cgImage: smallCGImage)
            }
            
            guard let data = UIImageJPEGRepresentation(image, Constants.Image.jpegCompressionQuality) else {
                Log.w("could not get image representation of thumbnail for role \(thumbnail.kind.rawValue)")
                return completion(false, nil)
            }
            
            do {
                try data.write(to: thumbnail.url)
            } catch {
                Log.e("could not write data")
                return completion(false, nil)
            }
        }
        
        // Generate preview videos
        
        self.middleClipWithReversal(at: originalVideoUrl, videoInfo: videoInfo, completion: { (success, outputUrl) in
            guard let largePreviewWithReversalOutputUrl = outputUrl, success else {
                Log.e("Failed to create middle clip version of video with reversal.")
                return completion(false, nil)
            }
            do {
                _ = try? FileManager.default.removeItem(at: largePreview.url)
                try FileManager.default.copyItem(at: largePreviewWithReversalOutputUrl, to: largePreview.url)
                
                self.smallVersionOfVideo(at: largePreviewWithReversalOutputUrl, completion: { (success, outputUrl) in
                    guard let smallPreviewWithReversalOutputUrl = outputUrl, success else {
                        Log.e("Failed to create small version of video.")
                        return completion(false, nil)
                    }
                    do {
                        _ = try? FileManager.default.removeItem(at: smallPreview.url)
                        try FileManager.default.copyItem(at: smallPreviewWithReversalOutputUrl, to: smallPreview.url)
                        
                        let thumbnails = (thumbnail: largeThumbnail, thumbnailSmall: smallThumbnail, preview: largePreview, previewSmall: smallPreview)
                        
                        for thumbnail in [largeThumbnail, smallThumbnail, largePreview, smallPreview] {
                            self.cache[temporaryID] = thumbnail
                        }
                        
                        completion(true, thumbnails)
                    } catch {
                        Log.e("Failed to move small version of video.")
                        return completion(false, nil)
                    }
                })
            } catch {
                Log.e("Error trying to move item")
                return completion(false, nil)
            }
        })
    }
    
    func middleClipWithReversal(at original: URL, gestureSegments: [SegmentData], boomerangLength: Double = 0.5, completion: @escaping (_ success: Bool, _ output: URL?) -> Void) {
        middleClipOfVideo(at: original, gestureSegments: gestureSegments, boomerangLength: boomerangLength) { (success, outputUrl) in
            guard let outputUrl = outputUrl, success else {
                Log.e("Failed to get middle clip of video")
                return completion(false, nil)
            }
            let forwardClip = AVAsset(url: outputUrl)
            
            self.reverseVideo(at: outputUrl, completion: { (success, outputUrl) in
                guard let outputUrl = outputUrl, success else {
                    Log.e("Failed to get reverse video")
                    return completion(false, nil)
                }
                
                let exportUrl = documentDirectory().appendingPathComponent("middle-reversed-clip-\(UUID().uuidString).mov")
                _ = try? FileManager.default.removeItem(at: exportUrl)
                self.tempFiles.append(exportUrl)
                
                let reverseClip = AVAsset(url: outputUrl)
                
                let composition = AVMutableComposition()
                let compositionTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
                
                let forwardClipTrack = forwardClip.tracks(withMediaType: .video).first!
                let reverseClipTrack = reverseClip.tracks(withMediaType: .video).first!
                
                do {
                    try compositionTrack?.insertTimeRange(CMTimeRangeMake(kCMTimeZero, forwardClip.duration), of: forwardClipTrack, at: kCMTimeZero)
                    
                    try compositionTrack?.insertTimeRange(CMTimeRangeMake(kCMTimeZero, reverseClip.duration), of: reverseClipTrack, at: forwardClip.duration)
                    
                    guard let exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality) else {
                        Log.e("Could not export video.")
                        return completion(false, nil)
                    }
                    
                    exporter.outputURL = exportUrl
                    exporter.outputFileType = AVFileType.mov
                    exporter.shouldOptimizeForNetworkUse = true
                    exporter.exportAsynchronously {
                        DispatchQueue.main.async {
                            switch exporter.status {
                            case .completed:
                                return completion(true, exportUrl)
                            case .waiting, .exporting, .unknown:
                                return
                            case .cancelled, .failed:
                                Log.e("failed to export: \(exporter.error)")
                                return completion(false, nil)
                            }
                        }
                    }
                } catch {
                    Log.e("Could not stitch forward and reverse clips together")
                    return completion(false, nil)
                }
            })
        }
    }
    
    private func middleClipWithReversal(at original: URL, videoInfo: VideoInfo?, completion: @escaping (_ success: Bool, _ output: URL?) -> Void) {
        middleClipOfVideo(at: original, videoInfo: videoInfo) { (success, outputUrl) in
            guard let outputUrl = outputUrl, success else {
                Log.e("Failed to get middle clip of video")
                return completion(false, nil)
            }
            let forwardClip = AVAsset(url: outputUrl)
            
            self.reverseVideo(at: outputUrl, completion: { (success, outputUrl) in
                guard let outputUrl = outputUrl, success else {
                    Log.e("Failed to get reverse video")
                    return completion(false, nil)
                }
                
                let exportUrl = documentDirectory().appendingPathComponent("middle-reversed-clip-\(UUID().uuidString).mov")
                _ = try? FileManager.default.removeItem(at: exportUrl)
                self.tempFiles.append(outputUrl)
                
                let reverseClip = AVAsset(url: outputUrl)
                
                let composition = AVMutableComposition()
                let compositionTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
                
                let forwardClipTrack = forwardClip.tracks(withMediaType: .video).first!
                let reverseClipTrack = reverseClip.tracks(withMediaType: .video).first!
                
                do {
                    try compositionTrack?.insertTimeRange(CMTimeRangeMake(kCMTimeZero, forwardClip.duration), of: forwardClipTrack, at: kCMTimeZero)
                    
                    try compositionTrack?.insertTimeRange(CMTimeRangeMake(kCMTimeZero, reverseClip.duration), of: reverseClipTrack, at: forwardClip.duration)
                    
                    
                    guard let exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality) else {
                        Log.e("Could not export video.")
                        return completion(false, nil)
                    }
                    
                    exporter.outputURL = exportUrl
                    exporter.outputFileType = AVFileType.mov
                    exporter.shouldOptimizeForNetworkUse = true
                    exporter.exportAsynchronously {
                        DispatchQueue.main.async {
                            switch exporter.status {
                            case .completed:
                                return completion(true, exportUrl)
                            case .waiting, .exporting, .unknown:
                                return
                            case .cancelled, .failed:
                                return completion(false, nil)
                            }
                        }
                    }
                } catch {
                    Log.e("Could not stitch forward and reverse clips together")
                    return completion(false, nil)
                }
            })
        }
    }
    
    private func middleClipOfVideo(at original: URL, videoInfo: VideoInfo?, completion: @escaping (_ success: Bool, _ output: URL?) -> Void) {
        if let segment = videoInfo?.detectedGesture?.segment {
            middleClipOfVideo(at: original, gestureSegments: [SegmentData(start: segment.startFrameID, end: segment.endFrameID, gesture: segment.gestureType)], completion: completion)
        } else {
            middleClipOfVideo(at: original, gestureSegments: [], completion: completion)
        }
    }
    
    private func middleClipOfVideo(at original: URL, gestureSegments: [SegmentData], boomerangLength: Double = 0.5, completion: @escaping (_ success: Bool, _ output: URL?) -> Void) {
        let outputUrl = documentDirectory().appendingPathComponent("middle-clip-\(UUID().uuidString).mov")
        _ = try? FileManager.default.removeItem(at: outputUrl)
        self.tempFiles.append(outputUrl)
        
        let asset = AVAsset(url: original)
        let composition = AVMutableComposition()
        let compositionTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
        let videoTrack = asset.tracks(withMediaType: .video).first!
        
        guard asset.duration.seconds > boomerangLength else {
            return completion(true, original)
        }
        
        do {
            let middle: Double
            if let segment = gestureSegments.first {
                middle = min(asset.duration.seconds - boomerangLength, (segment.endTime.seconds + segment.startTime.seconds) / 2)
            } else {
                middle = asset.duration.seconds / 2
            }
            let start = middle - boomerangLength / 2
            let duration = boomerangLength
            let timescale = Int32(NSEC_PER_SEC)
            
            try compositionTrack?.insertTimeRange(CMTimeRangeMake(CMTimeMakeWithSeconds(start, timescale), CMTimeMakeWithSeconds(duration, timescale)), of: videoTrack, at: kCMTimeZero)
            
            guard let exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality) else {
                Log.e("Could not export video.")
                return completion(false, nil)
            }
            
            exporter.outputURL = outputUrl
            exporter.outputFileType = AVFileType.mov
            exporter.shouldOptimizeForNetworkUse = true
            exporter.exportAsynchronously {
                DispatchQueue.main.async {
                    switch exporter.status {
                    case .completed:
                        return completion(true, outputUrl)
                    case .waiting, .exporting, .unknown:
                        return
                    case .cancelled, .failed:
                        return completion(false, nil)
                    }
                }
            }
            
        } catch {
            Log.e("Error inserting track")
            return completion(false, nil)
        }
    }
    
    private func smallVersionOfVideo(at originalUrl: URL, completion: @escaping (_ success: Bool, _ outputUrl: URL?) -> Void) {
        let outputUrl = documentDirectory().appendingPathComponent("small-clip.mov")
        _ = try? FileManager.default.removeItem(at: outputUrl)
        
        let asset = AVAsset(url: originalUrl)
        let videoTrack = asset.tracks(withMediaType: .video).first!
        
        let videoComposition = AVMutableVideoComposition()
        videoComposition.renderSize = KindOfThumbnail.previewSmall.size
        videoComposition.frameDuration = CMTimeMake(1, 30)
        
        let instruction = AVMutableVideoCompositionInstruction()
        instruction.timeRange = CMTimeRangeMake(videoTrack.timeRange.start, videoTrack.timeRange.duration)
        
        let layerInstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: videoTrack)
        
        func transformFromSize(from: CGSize, toSize to: CGSize) -> CGAffineTransform {
            return CGAffineTransform(scaleX: to.width/from.width, y: to.height/from.height)
        }
        
        let sizeTransform = transformFromSize(from: videoTrack.naturalSize, toSize: KindOfThumbnail.previewSmall.size)
        
        layerInstruction.setTransform(sizeTransform, at: kCMTimeZero)
        instruction.layerInstructions = [layerInstruction]
        videoComposition.instructions = [instruction]
        
        guard let exporter = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetMediumQuality) else {
            Log.e("Could not export video.")
            completion(false, nil)
            return
        }
        
        exporter.outputURL = outputUrl
        exporter.outputFileType = AVFileType.mov
        exporter.videoComposition = videoComposition
        exporter.exportAsynchronously {
            DispatchQueue.main.async {
                switch exporter.status {
                case .completed:
                    return completion(true, outputUrl)
                case .waiting, .exporting, .unknown:
                    return
                case .failed, .cancelled:
                    return completion(false, nil)
                }
            }
        }
        
    }
    
    private func reverseVideo(at originalUrl: URL, completion: @escaping (_ success: Bool, _ outputUrl: URL?) -> Void) {
        
        // Initialize the reader
        let originalAsset = AVAsset(url: originalUrl)
        var reader: AVAssetReader! = nil
        do {
            reader = try AVAssetReader(asset: originalAsset)
        } catch {
            Log.e("could not initialize reader.")
            return completion(false, nil)
        }
        
        guard let videoTrack = originalAsset.tracks(withMediaType: AVMediaType.video).last else {
            Log.e("could not retrieve the video track.")
            return completion(false, nil)
        }
        
        let readerOutputSettings: [String: Any] = [kCVPixelBufferPixelFormatTypeKey as String : Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
        let readerOutput = AVAssetReaderTrackOutput(track: videoTrack, outputSettings: readerOutputSettings)
        reader.add(readerOutput)
        
        reader.startReading()
        
        // read in samples
        
        var samples: [CMSampleBuffer] = []
        while let sample = readerOutput.copyNextSampleBuffer() {
            samples.append(sample)
        }
        
        // Initialize the writer
        
        let writer: AVAssetWriter
        let outputUrl = documentDirectory().appendingPathComponent("reversed-clip-\(UUID().uuidString).mov")
        _ = try? FileManager.default.removeItem(at: outputUrl)
        self.tempFiles.append(outputUrl)
        do {
            writer = try AVAssetWriter(outputURL: outputUrl, fileType: AVFileType.mov)
        } catch let error {
            Log.e(error)
            return completion(false, nil)
        }
        
        let videoCompositionProps = [AVVideoAverageBitRateKey: Constants.Video.desiredAverageBitrate]
        let writerOutputSettings = [
            AVVideoCodecKey: AVVideoCodecType.h264,
            AVVideoWidthKey: videoTrack.naturalSize.width,
            AVVideoHeightKey: videoTrack.naturalSize.height,
            AVVideoCompressionPropertiesKey: videoCompositionProps
            ] as [String : Any]
        
        let writerInput = AVAssetWriterInput(mediaType: AVMediaType.video, outputSettings: writerOutputSettings)
        writerInput.expectsMediaDataInRealTime = false
        writerInput.transform = videoTrack.preferredTransform
        
        let pixelBufferAdaptor = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: writerInput, sourcePixelBufferAttributes: nil)
        
        guard !samples.isEmpty else {
            return completion(false, originalUrl)
        }
        
        writer.add(writerInput)
        writer.startWriting()
        writer.startSession(atSourceTime: CMSampleBufferGetPresentationTimeStamp(samples.first!))
        
        for (index, sample) in samples.enumerated() {
            let presentationTime = CMSampleBufferGetPresentationTimeStamp(sample)
            if let imageBufferRef = CMSampleBufferGetImageBuffer(samples[samples.count - 1 - index]) {
                while !writerInput.isReadyForMoreMediaData {
                    Thread.sleep(forTimeInterval: 0.1)
                }
                
                pixelBufferAdaptor.append(imageBufferRef, withPresentationTime: presentationTime)
            }
        }
        
        writer.finishWriting {
            if let error = writer.error {
//                Log.e("failed to write with \(error)")
                return completion(false, nil)
            } else {
                return completion(true, outputUrl)
            }
        }
    }
    
    /// Deletes cached processed videos if any. You must remember to call this method before the app quits. Forgetting to do so will result in an amassing number of thumbnails saved to disk.
    func cleanup() {
        for (_, thumbnail) in cache {
            if FileManager.default.fileExists(atPath: thumbnail.url.path) {
                do {
                    try FileManager.default.removeItem(at: thumbnail.url)
                } catch {
//                    Log.e("Error removing file at \(thumbnail.url)")
                }
            }
        }
        
        for file in tempFiles {
            if FileManager.default.fileExists(atPath: file.path) {
                do {
                    try FileManager.default.removeItem(at: file)
                } catch {
//                    Log.e("Error removing file at \(file)")
                }
            }
        }
    }
    
}



