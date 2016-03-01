//
//  GameScene.swift
//  Ball 4
//
//  Created by Wes Van der Klomp on 5/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let ball = Ball()
    
    let spriteBall = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFromRect: CGRect(x: 0, y: 0, width: 100, height: 100))
        physicsWorld.gravity = CGVector(dx: -10, dy: 0)
        
        addChild(ball)
    }
    
    override func keyDown(theEvent: NSEvent) {
        if theEvent.keyCode == 126 {
            println("Up")
        } else if theEvent.keyCode == 124 {
            println("Right")
        } else if theEvent.keyCode == 123 {
//            ball.moveLeft()
            println("Left")
        } else {
            println(theEvent.keyCode)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
