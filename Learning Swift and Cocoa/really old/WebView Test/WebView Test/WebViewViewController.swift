//
//  WebViewViewController.swift
//  WebView Test
//
//  Created by Wesley Van der Klomp on 12/28/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {

    @IBAction func back(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://apple.com")
        
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
