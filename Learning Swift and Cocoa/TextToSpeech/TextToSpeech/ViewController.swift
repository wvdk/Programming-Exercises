//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Wesley Van der Klomp on 1/26/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func speakButton(sender: UIButton) {
        myUtterance = AVSpeechUtterance(string: textView.text)
        myUtterance.rate = 0.3
        synth.speakUtterance(myUtterance)
    }


}

