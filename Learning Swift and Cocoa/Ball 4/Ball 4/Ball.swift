//
//  Ball.swift
//  Ball 4
//
//  Created by Wes Van der Klomp on 5/8/15.
//
//

import SpriteKit

class Ball: SKShapeNode {
    override init() {
        super.init()
    
        let myPath = CGPathCreateMutable()
        CGPathAddArc(myPath, nil, CGFloat(10), CGFloat(10), CGFloat(5), CGFloat(0), CGFloat(M_PI * 2), true)
        path = myPath
        fillColor = SKColor.whiteColor()
        position = CGPoint(x: frame.width/2, y: frame.height/2)
        physicsBody = SKPhysicsBody(circleOfRadius: 3)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveLeft() {
        println("moveLeft")
        position.x = position.x - 10
    }
}
