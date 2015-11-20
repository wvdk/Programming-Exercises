//
//  ViewController.swift
//  On Off 6
//
//  Created by Wes Van der Klomp on 4/18/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bg: UIView!
    @IBAction func `switch`(sender: AnyObject) {
        if bg.backgroundColor == UIColor.greenColor() {
            bg.backgroundColor = UIColor.yellowColor()
        } else {
            bg.backgroundColor = UIColor.greenColor()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bg.backgroundColor = UIColor.greenColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

