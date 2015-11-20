//
//  ViewController.swift
//  Browser 2
//
//  Created by Wes Van der Klomp on 5/28/15.
//  Copyright (c) 2015 Sadness. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet weak var addressBar: NSTextField!
    @IBOutlet weak var wView: WebView!
    
    @IBAction func enterURL(sender: NSTextField) {
        println("enterURL has been called with \(sender.stringValue)\nGoing to check that it's a valid URL.")
        
        if find(sender.stringValue, ".") != nil {
            let url = NSURL(string: sender.stringValue)
            let req = NSURLRequest(URL: url!)
            if NSURLConnection.canHandleRequest(req) {
                wView.mainFrame.loadRequest(req)
                println("It is a valid URL. Loading page.\n")
            } else {
                println("Not a valid URL. Going to try prepending http:// to sender.stringValue.")

                // add http:// and try again
                let newUrl = NSURL(string: "http://\(sender.stringValue)")
                let newReq = NSURLRequest(URL: newUrl!)
                if NSURLConnection.canHandleRequest(newReq) {
                    wView.mainFrame.loadRequest(newReq)
                    println("That worked. Page loading.\n")
                }
            }
        } else {
            let searchText = sender.stringValue.stringByReplacingOccurrencesOfString(" ", withString: "+")
            let searchURL = NSURL(string: "https://duckduckgo.com/?q=\(searchText)")
            let searchReq = NSURLRequest(URL: searchURL!)
            wView.mainFrame.loadRequest(searchReq)
        }
    }
    
    // TODO: When user clicks a link in web view, update addressbar w/ new address.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterURL(addressBar)
    }
}

