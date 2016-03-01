//
//  ViewController.swift
//  On Off
//
//  Created by Wes Van der Klomp on 4/14/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBAction func button(sender: AnyObject) {
        if backgroundView.backgroundColor == UIColor.whiteColor() {
            backgroundView.backgroundColor = UIColor.blackColor()
            buttonOutlet.setTitle("On", forState: UIControlState.Normal)
        } else {
            backgroundView.backgroundColor = UIColor.whiteColor()
            buttonOutlet.setTitle("Off", forState: UIControlState.Normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.backgroundColor = UIColor.whiteColor()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

