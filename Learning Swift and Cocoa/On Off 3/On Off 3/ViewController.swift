//
//  ViewController.swift
//  On Off 3
//
//  Created by Wes Van der Klomp on 4/16/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bg: UIView!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBAction func switched(sender: AnyObject) {
        if bg.backgroundColor != UIColor.blueColor() {
            bg.backgroundColor = UIColor.blueColor()
        } else {
            bg.backgroundColor = UIColor.redColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bg.backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

