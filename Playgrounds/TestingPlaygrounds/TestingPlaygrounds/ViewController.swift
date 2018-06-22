//
//  ViewController.swift
//  TestingPlaygrounds
//
//  Created by Wesley Van der Klomp on 6/21/18.
//  Copyright © 2018 wes. All rights reserved.
//

import UIKit
import MyCustomFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyCustomClass.printMyName()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

