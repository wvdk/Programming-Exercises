//
//  ViewController.swift
//  Text Adventure
//
//  Created by Wesley Van der Klomp on 11/30/14.
//  Copyright (c) 2014 wvdk. All rights reserved.
//

import UIKit

var ProcessChoice = ProcessUserChoice(scene: 0, choice: 0)

class ViewController: UIViewController {

    @IBOutlet weak var textDisplay: UITextView!
    @IBOutlet weak var firstOptionOutlet: UIButton!
    @IBOutlet weak var secondOptionOutlet: UIButton!
    @IBOutlet weak var thirdOptionOutlet: UIButton!
    @IBOutlet weak var fourthOptionOutlet: UIButton!
    @IBOutlet weak var fifthOptionOutlet: UIButton!

    @IBAction func firstOption(sender: AnyObject) {
        ProcessChoice.buttonPressed(scene: ProcessChoice.scene, choice: 1)
        firstOptionOutlet.setTitle(ProcessChoice.buttonText, forState: UIControlState.Normal)
        textDisplay.text = ProcessChoice.displayText
    }

    @IBAction func secondOption(sender: AnyObject) {
        ProcessChoice.buttonPressed(scene: ProcessChoice.scene, choice: 2)
        secondOptionOutlet.setTitle(ProcessChoice.buttonText, forState: UIControlState.Normal)
        textDisplay.text = ProcessChoice.displayText
    }

    @IBAction func thirdOption(sender: AnyObject) {
        ProcessChoice.buttonPressed(scene: ProcessChoice.scene, choice: 3)
        thirdOptionOutlet.setTitle(ProcessChoice.buttonText, forState: UIControlState.Normal)
        textDisplay.text = ProcessChoice.displayText
    }

    @IBAction func fourthOption(sender: AnyObject) {
        ProcessChoice.buttonPressed(scene: ProcessChoice.scene, choice: 4)
        fourthOptionOutlet.setTitle(ProcessChoice.buttonText, forState: UIControlState.Normal)
        textDisplay.text = ProcessChoice.displayText
    }

    @IBAction func fifthOption(sender: AnyObject) {
        ProcessChoice.buttonPressed(scene: ProcessChoice.scene, choice: 5)
        fifthOptionOutlet.setTitle(ProcessChoice.buttonText, forState: UIControlState.Normal)
        textDisplay.text = ProcessChoice.displayText
    }
}

