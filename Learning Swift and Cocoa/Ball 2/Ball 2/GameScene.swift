//
//  GameScene.swift
//  Ball 2
//
//  Created by Wes Van der Klomp on 5/3/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFromRect: frame)

        createBall(CGPoint(x: frame.width/2, y: frame.height/2))
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)

            createBall(location)
        }
    }
    
    func createBall(position: CGPoint) {
        let ball = SKShapeNode(circleOfRadius: 15)
        ball.fillColor = SKColor.whiteColor()
        ball.position = position
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ball.physicsBody?.dynamic = true
        
        addChild(ball)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
