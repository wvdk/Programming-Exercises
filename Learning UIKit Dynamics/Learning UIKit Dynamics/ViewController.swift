//
//  ViewController.swift
//  Learning UIKit Dynamics
//
//  Created by Wesley Van der Klomp on 8/9/18.
//  Copyright © 2018 wes. All rights reserved.
//

import UIKit

class MoveSupport {
    
    var animator : UIDynamicAnimator

    
    init(moveableView : UIView) {
        self.animator = UIDynamicAnimator(referenceView: moveableView.superview!)

        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(pan))
        moveableView.addGestureRecognizer(recognizer)
    }
    
    @objc func pan(_ recognizer : UIPanGestureRecognizer) {
        let view = recognizer.view!
        
        switch(recognizer.state) {
            
        case .began:
            animator.removeAllBehaviors()
            
        case .changed:
            let translation = recognizer.translation(in: view)
            view.center.x += translation.x
            view.center.y += translation.y
            recognizer.setTranslation(.zero, in: view)
            
        case .ended:
            let velocity = recognizer.velocity(in: view)
            
            let behavior = UIDynamicItemBehavior(items: [view])
            behavior.addLinearVelocity(velocity, for: view)
            behavior.resistance = 3.0
            animator.addBehavior(behavior)
            
        default:
            break
        }
    }
    
}

class ViewController: UIViewController {

    let redBox = UIView(frame: .zero)
    var moveSupport: MoveSupport!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redBox.backgroundColor = .red
        redBox.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(redBox)
        moveSupport = MoveSupport(moveableView: redBox)
    }
    
}

