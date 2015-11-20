//
//  ViewController.swift
//  Learning GCD
//
//  Created by Wesley Van der Klomp on 9/17/15.
//  Copyright © 2015 wvdk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    var myQueue = dispatch_queue_create("queue.my", nil)
    
    @IBAction func runThing(sender: AnyObject) {
        
        button.enabled = false
        
        
        // Note: You should never update the UIfrom anything other than the main thread. It's unreliable.
        dispatch_async(myQueue, {
            self.longRunningOperation()
        })
    }
    
    func longRunningOperation() {
        print("starting longRunningOperation")
        NSThread.sleepForTimeInterval(2.5)
        print("done with longRunningOperation")
        
        dispatch_async(dispatch_get_main_queue(), {
            if self.button.enabled == false {
                self.button.enabled = true
            }
        })
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.setTitle("Running...", forState: .Disabled)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

