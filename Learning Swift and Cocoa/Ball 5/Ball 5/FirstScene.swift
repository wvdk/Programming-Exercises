//
//  GameScene.swift
//  Ball 5
//
//  Created by Wes Van der Klomp on 5/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

import SpriteKit

class FirstScene: SKScene {
    
    let ball = PlayerSprite()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        physicsBody = SKPhysicsBody(edgeLoopFromRect: frame)
        
        addChild(ball)
    }
    
    override func keyDown(theEvent: NSEvent) {
        if theEvent.keyCode == 123 {
            println("left")
            ball.moveLeft()
        } else if theEvent.keyCode == 126 {
            println("jump")
            ball.jump()
        } else if theEvent.keyCode == 124 {
            println("right")
            ball.moveRight()
        } else {
            println("keyCode: \(theEvent.keyCode)")
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
