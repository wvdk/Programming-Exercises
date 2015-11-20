//
//  ViewController.swift
//  Browser
//
//  Created by Wes Van der Klomp on 5/24/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var wView: WebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.google.com/")
        let request = NSURLRequest(URL: url!)
        
        wView.mainFrame.loadRequest(request)

    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

