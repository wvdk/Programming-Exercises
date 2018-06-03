//
//  ViewController.swift
//  My First tvOS App
//
//  Created by Wesley Van der Klomp on 5/11/18.
//  Copyright © 2018 wes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let testLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        testLabel.backgroundColor = .red
        testLabel.text = "Hello World!"
        view.addSubview(testLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

