//
//  ViewController.swift
//  Testing Audio Recorder
//
//  Created by Wesley Van der Klomp on 10/17/18.
//  Copyright © 2018 wes. All rights reserved.
//

import UIKit
import AVFoundation

/// Extension that adds several functions for temporary URLs related to octis
public extension FileManager {
    
    /// Returns the main documents directory for the app
    ///
    /// - Returns: The documents directory for the app
    public func documentDirectory() -> URL {
        let paths = urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}

class ViewController: UIViewController {

    var audioRecorder: AVAudioRecorder
    
    required init?(coder aDecoder: NSCoder) {
        
        do {
            try? AVAudioSession.sharedInstance().setActive(false)

            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.videoRecording, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error: could not set audio session category. \(error)")
        }
        
        let url = URL(fileURLWithPath: "capturedAudio.m4a", isDirectory: false, relativeTo: FileManager.default.documentDirectory())
        
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVEncoderBitRateKey: 128000,
            AVLinearPCMBitDepthKey: 16,
            AVNumberOfChannelsKey: 1,
            AVLinearPCMIsBigEndianKey: false,
            AVLinearPCMIsFloatKey: false,
            AVSampleRateKey: 44100.0
        ]
        
//        let settings: [String: Any] = [
//            AVFormatIDKey: Int(kAudioFormatLinearPCM),
//            AVEncoderBitRateKey: 128000,
//            AVLinearPCMBitDepthKey: 16,
//            AVNumberOfChannelsKey: 2,
////            AVLinearPCMIsBigEndianKey: false,
////            AVLinearPCMIsFloatKey: false,
//            AVSampleRateKey: 44100.0
//        ]

//        recorderSettings = [[NSMutableDictionary alloc] init];
//        [recorderSettings setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
//        [recorderSettings setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
//        [recorderSettings setValue :[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
//        [recorderSettings setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
//        [recorderSettings setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];

        
        audioRecorder = try! AVAudioRecorder(url: url, format: AVAudioFormat(settings: settings)!)
        
        
        print("wid: --- viewDidLoad() ------------------ ")
        print("wid: ")
        print("wid: initializing audio recorder")
        print("wid: ")
        print("wid: audioRecorder.url: \(audioRecorder.url)")
        print("wid: ")
        print("wid: url: \(url)")
        print("wid: ")
        print("wid: prep to record. Success: \(audioRecorder.prepareToRecord())")
        print("wid: ")
        print("wid: audio recorder settings: \(audioRecorder.settings)")
        print("wid: ")
        print("wid: input is available: \(AVAudioSession.sharedInstance().isInputAvailable)")
        print("wid: ")

        super.init(coder: aDecoder)
        
        audioRecorder.delegate = self

        startRecording(self)

    }

    @IBAction func startRecording(_ sender: Any) {
        stopRecording(self)
        print("wid: ")
        print("wid: ")
        print("wid: ")
        print("wid: --- shutterButtonDown() ------------------------")
        print("wid: ")
        print("wid: \(AVAudioSession.sharedInstance().mode)")
        print("wid: ")
        print("wid: enable metering")
        audioRecorder.isMeteringEnabled = true
        audioRecorder.updateMeters()
        print("wid: channelAssignments \(audioRecorder.channelAssignments)")
        print("wid: isRecording: \(audioRecorder.isRecording)")
        print("wid: ")
        print("wid: Starting to record.")
        audioRecorder.record(forDuration: 5)
        print("wid: ")
        print("wid: isRecording: \(audioRecorder.isRecording)")
        print("wid: ")
        print("wid: audio recorder settings: \(audioRecorder.settings)")
        print("wid: ")

    }
    
    @IBAction func stopRecording(_ sender: Any) {
        print("wid: ")
        print("wid: ")
        print("wid: ")
        print("wid: ")
        print("wid: --- stopRecording() ----------------------------")
        print("wid: ")
        print("wid: ")
        audioRecorder.updateMeters()
        let averagePower = audioRecorder.averagePower(forChannel: 0)
        print("wid: avg. power: \(averagePower)")
        let peakPower = audioRecorder.peakPower(forChannel: 0)
        print("wid: peak power: \(peakPower)")
        print("wid: ")
        print("wid: isMeteringEnabled: \(audioRecorder.isMeteringEnabled)")
        print("wid: isRecording: \(audioRecorder.isRecording)")
        
        print("wid: ")
        audioRecorder.stop()
    }
    
    var audioPlayer: AVAudioPlayer! = nil
    
    @IBAction func playRecording(_ sender: Any) {
        print("wid: ")
        print("wid: ")
        print("wid: ")
        print("wid: ")
        print("wid: --- playRecording() --------------")
        print("wid: ")
        audioPlayer = try! AVAudioPlayer(contentsOf: audioRecorder.url)
        print("wid: prepare to play success: \(audioPlayer.prepareToPlay())")
        print("wid: play success: \(audioPlayer.play())")
        print("wid: isPlaying: \(audioPlayer.isPlaying)")
    }
    
}

extension ViewController: AVAudioRecorderDelegate {
    
    func audioRecorderBeginInterruption(_ recorder: AVAudioRecorder) {
        print("wid: audioRecorderBeginInterruption ")
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("wid: audioRecorderDidFinishRecording successfully: \(flag)")
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print("wid: \(error)")
    }
    
}

