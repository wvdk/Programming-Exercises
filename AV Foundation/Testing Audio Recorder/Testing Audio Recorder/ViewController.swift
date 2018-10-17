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
    
    var audioPlayer: AVAudioPlayer
    
    required init?(coder aDecoder: NSCoder) {
        
        do {
            try? AVAudioSession.sharedInstance().setActive(false)
            //                try self.audioSession.setCategory(convertFromAVAudioSessionCategory(AVAudioSession.Category.playAndRecord), with: [.mixWithOthers, .defaultToSpeaker, .allowBluetooth])
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.record, mode: AVAudioSession.Mode.videoRecording, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error: could not set audio session category. \(error)")
        }
        
//        SoundManager.shared.setupRecordingAudioSession()
        
        let documentDirectory = FileManager.default.documentDirectory()
        //        if !FileManager.default.fileExists(atPath: directory.path) {
        //            try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
        //            print("Creating a directory for: \(uuid)")
        //        }
        let url = URL(fileURLWithPath: "capturedAudio.m4a", isDirectory: false, relativeTo: documentDirectory)
        
//        audioRecorder = try! AVAudioRecorder(url: url, settings: [
//            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
//            AVEncoderBitRateKey: 128000,
//            AVNumberOfChannelsKey: 1,
//            AVSampleRateKey: 44100.0
//            ])
        
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVEncoderBitRateKey: 128000,
            AVNumberOfChannelsKey: 1,
            AVSampleRateKey: 44100.0
        ]
        audioRecorder = try! AVAudioRecorder(url: url, format: AVAudioFormat(settings: settings)!)
        
        print("wid: --- viewDidLoad() ------------------ ")
        
        print("wid: initializing audio recorder")
        print("wid: ")
        print("wid: audioRecordr.url: \(audioRecorder.url)")
        print("wid: ")
        print("wid: documentDirectory: \(documentDirectory)")
        print("wid: ")
        print("wid: url: \(url)")
        print("wid: ")
        print("wid: prep to record. Success: \(audioRecorder.prepareToRecord())")
        print("wid: ")
        print("wid: audio recorder settings: \(audioRecorder.settings)")
        print("wid: ")
        print("wid: ")
        print("wid: ")
        print("wid: ")
        
        
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()



    }

    @IBAction func startRecording(_ sender: Any) {

        print("wid: ")
        print("wid: --- shutterButtonDown() ------------------------")
        print("wid: ")
        print("wid: \(AVAudioSession.sharedInstance().mode)")
        print("wid: ")
        print("wid: enable metering")
        audioRecorder.isMeteringEnabled = true
        print("wid: ")
        print("wid: Starting to record.")
        audioRecorder.record()
        print("wid: ")
        print("wid: isRecording: \(audioRecorder.isRecording)")
        print("wid: ")
        print("wid: audio recorder settings: \(audioRecorder.settings)")
        print("wid: ")

    }
    
    @IBAction func stopRecording(_ sender: Any) {
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
    
    @IBAction func playRecording(_ sender: Any) {
        
    }
    
}


