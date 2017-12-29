import Foundation

class Video {
    var id
    var isCurrentlyPosting
    var localFileUrl
    var unrenderedVideo: URL?
    var remoteDownloadUrl?
    var metadataURL: URL?

    let size: CGSize
    let fps: Double

    var thumbnailImageLarge?
    var thumbnailImageSmall?
    
    var previewVideoLarge?
    var previewVideoSmall?

    let postedByUser: UserData
    let segments: [SegmentData]?
    var rigs: [SceneRig] = []
    var planes: [(center: Vector3, extent: Vector3, transform: SCNMatrix4)] = []
    var selectedEffect: MagicEffect?
    let jointFrames: [RawJointsFrame]
    var allGestures: [RawGesture]
    var rawDabGestures: [RawGesture] { ... }
    var rawMoneyGestures: [RawGesture] { ... }
    var rawHelloGestures: [RawGesture] { ... }
    var rawLitGestures: [RawGesture] { ... }
    var rawKissGestures: [RawGesture] { ... }
    var rawBoxingGestures: [RawGesture] { ... }
    var rawBooshGestures: [RawGesture] { ... }
    var detectedGesture: RawGesture? { ... }
}












