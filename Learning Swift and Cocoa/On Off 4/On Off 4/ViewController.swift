//
//  ViewController.swift
//  On Off 4
//
//  Created by Wes Van der Klomp on 4/16/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bg: UIView!
    @IBAction func switched(sender: UISwitch) {
        if sender.on == true {
            bg.backgroundColor = UIColor.whiteColor()
        } else {
            bg.backgroundColor = UIColor.blackColor()
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

