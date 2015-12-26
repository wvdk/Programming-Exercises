//
//  ViewController.swift
//  Testing Environment Variables
//
//  Created by Wesley Van der Klomp on 12/26/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "This worked..."
        
        let environment = NSProcessInfo.processInfo().environment
        if environment["testEnvVar"] != nil {
            label.text = "EnvVar worked."
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

