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
    
    private let transformMeLayer = CAShapeLayer()


    override func draw(_ rect: CGRect) {
        toyBallLayer.position = CGPoint(x: 20, y: 20)
        toyBallLayer.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        toyBallLayer.backgroundColor = UIColor.red.cgColor
        toyBallLayer.cornerRadius = 15
        
        self.layer.addSublayer(toyBallLayer)
        
        
        
        /// Let's make a new layer
        
        transformMeLayer.position = CGPoint(x: -50, y: -50)
        
        
        
        let polygonPath = UIBezierPath()
        polygonPath.move(to: CGPoint(x: 117, y: 38))
        polygonPath.addLine(to: CGPoint(x: 184.76, y: 88.44))
        polygonPath.addLine(to: CGPoint(x: 158.88, y: 170.06))
        polygonPath.addLine(to: CGPoint(x: 75.12, y: 170.06))
        polygonPath.addLine(to: CGPoint(x: 49.24, y: 88.44))
        polygonPath.close()
        
        
        
        transformMeLayer.path = polygonPath.cgPath
        
        self.layer.addSublayer(transformMeLayer)
        
        
        

        
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
        
        transformMeLayer.position = CGPoint(x: 50, y: 50)
        
        let polygonPath = UIBezierPath()
        polygonPath.move(to: CGPoint(x: 117, y: 38))
        polygonPath.addLine(to: CGPoint(x: 184.76, y: 88.44))
        polygonPath.addLine(to: CGPoint(x: 49.24, y: 88.44))
        polygonPath.close()
        
        
        
        transformMeLayer.path = polygonPath.cgPath

    }
    
    @IBAction func moveBallRight() {
        toyBallLayer.position = CGPoint(x: self.frame.width - 20, y: 20)
    }
    
    @IBAction func moveBallLeft() {
        toyBallLayer.position = CGPoint(x: 20, y: 20)
    }
}
