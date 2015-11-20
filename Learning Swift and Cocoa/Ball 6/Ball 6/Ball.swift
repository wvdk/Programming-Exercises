//
//  Ball.swift
//  Ball 6
//
//  Created by Wes Van der Klomp on 5/10/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit

class Ball: SKSpriteNode {
    
    let ballSize = CGSize(width: 10, height: 10)
    let ballRadius: CGFloat = 5.0
    
    // MARK: Initalize
    override init(texture: SKTexture!, color: NSColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: ballSize)
        
        self.texture = SKTexture(imageNamed: "redBall.png")
        self.color = SKColor.blueColor()
        self.position = CGPoint(x: 50, y: 50)
        self.physicsBody = SKPhysicsBody(circleOfRadius: ballRadius)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Controls
    func moveLeft() {
        
    }
    func moveRight() {
        
    }
    func jump() {
        
    }
}
