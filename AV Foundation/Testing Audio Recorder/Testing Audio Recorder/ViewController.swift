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

    var audioRecorder: AVAudioRecorder! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let uuid = UUID().uuidString
        let directory = FileManager.default.documentDirectory().appendingPathComponent("recordings").appendingPathComponent(uuid)
        if !FileManager.default.fileExists(atPath: directory.path) {
            try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
            print("Creating a directory for: \(uuid)")
        }
        let url = URL(fileURLWithPath: "capturedAudio.m4a", isDirectory: false, relativeTo: directory)
        
        audioRecorder = try? AVAudioRecorder(url: url, settings: [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVEncoderBitRateKey: 128000,
            AVNumberOfChannelsKey: 1,
            AVSampleRateKey: 44100.0
        ])

    }

    @IBAction func startRecording(_ sender: Any) {
        
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        
    }
    
}


