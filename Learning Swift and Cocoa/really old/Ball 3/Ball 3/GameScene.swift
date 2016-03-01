//
//  GameScene.swift
//  Ball 3
//
//  Created by Wes Van der Klomp on 5/3/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    let manager: CMMotionManager = CMMotionManager()
    let ball = SKShapeNode(circleOfRadius: 15)
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        ball.fillColor = SKColor.whiteColor()
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ball.physicsBody?.dynamic = true
        ball.position = CGPoint(x: frame.width/2, y: frame.height/2)
        
        addChild(ball)
        

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {

        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if manager.gyroAvailable {
            println("gyroAvailable");
            manager.startGyroUpdates()
            
            if let gyroData = manager.gyroData {
                let currentX = ball.position.x
                let currentY = ball.position.y
                let newY = Int(currentX) + Int(gyroData.rotationRate.x)
//                let newX = Int(currentY) + Int(gyroData.rotationRate.y)
                ball.position = CGPoint(x: Int(currentX), y: newY)
            }
            
        }
    }
}
