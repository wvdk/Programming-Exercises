//
//  PlayerSprite.swift
//  Ball 5
//
//  Created by Wes Van der Klomp on 5/9/15.
//
//

import SpriteKit

class PlayerSprite: SKSpriteNode {
    
    // MARK: Initialize
    override init(texture: SKTexture!, color: NSColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        let spriteSize = CGSize(width: 50, height: 50)
        let ballRadius = spriteSize.height/2
        
        self.texture = SKTexture(imageNamed: "redBall.png")
        self.size = spriteSize
        self.position = CGPoint(x: 100, y: 300)
        self.physicsBody = SKPhysicsBody(circleOfRadius: ballRadius)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Controls
    func moveLeft() {
        self.physicsBody?.applyForce(CGVector(dx: -500, dy: 0))
    }
    func jump() {
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: +50))
    }
    func moveRight() {
        self.physicsBody?.applyForce(CGVector(dx: +500, dy: 0))
    }
    
}
