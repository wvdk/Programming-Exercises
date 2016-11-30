//
//  ViewController.swift
//  PeriodicalScreenCap
//
//  Created by Wesley Van der Klomp on 11/17/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var pathField: NSTextField!
    @IBOutlet weak var timeIntervalFields: NSTextField!
    
    let task = Process()
    
    
    @IBAction func start(_ sender: NSButton) {
        print("Starting")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

