//
//  ViewController.swift
//  Learning AVAudioSession
//
//  Created by Wesley Van der Klomp on 5/1/17.
//  Copyright © 2017 wvdk. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var captureSession = AVCaptureSession()
    
    var movieOutput = AVCaptureMovieFileOutput()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up capture session
        captureSession.sessionPreset = AVCaptureSessionPresetHigh

        // Add video device
        let camera = AVCaptureDevice.defaultDevice(withDeviceType: AVCaptureDeviceType.builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: AVCaptureDevicePosition.back)
        
        do {
            let videoInput = try AVCaptureDeviceInput(device: camera)
            
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        // Add audio device
        let mic = AVCaptureDevice.defaultDevice(withDeviceType: AVCaptureDeviceType.builtInMicrophone, mediaType: AVMediaTypeAudio, position: .unspecified)
        
        do {
            let micInput = try AVCaptureDeviceInput(device: mic)
            
            if captureSession.canAddInput(micInput) {
                captureSession.addInput(micInput)
            }
        } catch {
            print(error.localizedDescription)
        }

        // Add output
        if captureSession.canAddOutput(movieOutput) {
            captureSession.addOutput(movieOutput)
        }
        
        // Start session
        captureSession.startRunning()
        
        
    }

}

