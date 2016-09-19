//
//  ViewController.swift
//  target-action demo
//
//  Created by Wesley Van der Klomp on 9/19/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func switchFlipped(_ sender: UISwitch) {
        print(sender.isOn)
    }

}

