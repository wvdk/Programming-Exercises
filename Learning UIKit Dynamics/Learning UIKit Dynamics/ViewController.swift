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
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
        redBox.addGestureRecognizer(panGesture)
    }
    
    @objc private func pan(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: redBox)
        redBox.center.x += translation.x
        redBox.center.y += translation.y
        gesture.setTranslation(.zero, in: redBox)
        
        
        
        print("Pan detected. Translation: \(translation)")
    }

}

