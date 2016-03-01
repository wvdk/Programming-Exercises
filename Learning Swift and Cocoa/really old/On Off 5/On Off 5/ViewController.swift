//
//  ViewController.swift
//  On Off 5
//
//  Created by Wes Van der Klomp on 4/17/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func switched(sender: UISwitch) {
        if sender.on == true {
            self.view.backgroundColor = UIColor.redColor()
        } else {
            self.view.backgroundColor = UIColor.blueColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.redColor()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

