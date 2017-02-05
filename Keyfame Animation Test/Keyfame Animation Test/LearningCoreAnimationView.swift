//
//  LearningCoreAnimationView.swift
//  Keyfame Animation Test
//
//  Created by Wesley Van der Klomp on 2/4/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import UIKit

class LearningCoreAnimationView: UIView {
    
    private let toyBallLayer = CALayer()
    private var toyIsSquare = false

    override func draw(_ rect: CGRect) {
        toyBallLayer.position = CGPoint(x: 20, y: 20)
        toyBallLayer.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        toyBallLayer.backgroundColor = UIColor.red.cgColor
        toyBallLayer.cornerRadius = 15
        
        self.layer.addSublayer(toyBallLayer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("LearningCoreAnimationView Touched")
        if toyIsSquare == true {
            toyBallLayer.cornerRadius = 15
            toyIsSquare = false
        } else {
            toyBallLayer.cornerRadius = 0
            toyIsSquare = true
        }
    }
    
    @IBAction func moveBallRight() {
        toyBallLayer.position = CGPoint(x: self.frame.width - 20, y: 20)
    }
    
    @IBAction func moveBallLeft() {
        toyBallLayer.position = CGPoint(x: 20, y: 20)
    }
}
