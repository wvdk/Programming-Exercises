//
//  ViewController.swift
//  Learning UIKit Dynamics
//
//  Created by Wesley Van der Klomp on 8/9/18.
//  Copyright © 2018 wes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let redBox = UIView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redBox.backgroundColor = .red
        redBox.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(redBox)
    }

}

