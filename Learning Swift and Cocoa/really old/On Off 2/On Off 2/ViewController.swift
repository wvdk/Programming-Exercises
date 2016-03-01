//
//  ViewController.swift
//  On Off 2
//
//  Created by Wes Van der Klomp on 4/15/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bg: UIView!
    @IBOutlet weak var button: UIButton!
    @IBAction func button(sender: AnyObject) {
        if bg.backgroundColor == UIColor.whiteColor() {
            bg.backgroundColor = UIColor.blackColor()
            button.setTitle("On", forState: UIControlState.Normal)
        } else {
            bg.backgroundColor = UIColor.whiteColor()
            button.setTitle("Off", forState: UIControlState.Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bg.backgroundColor = UIColor.whiteColor()
        button.setTitle("Off", forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

