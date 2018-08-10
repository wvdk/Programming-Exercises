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
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redBox.backgroundColor = .red
        redBox.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(redBox)
        
        view.addGestureRecognizer(panGesture)
    }
    
    @objc private func pan(_ gesture: UIPanGestureRecognizer) {
        print("Pan detected.")
        let translation = gesture.translation(in: view)
        redBox.center = CGPoint(x: translation.x, y: translation.y)
    }

}

