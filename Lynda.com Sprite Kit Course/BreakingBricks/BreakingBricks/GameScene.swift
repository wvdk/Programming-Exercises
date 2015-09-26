//
//  GameScene.swift
//  BreakingBricks
//
//  Created by Wes Van der Klomp on 2/21/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit
//import EndScene

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // Creating all my nodes
    let ball = SKSpriteNode(imageNamed: "ball")
    let paddle = SKSpriteNode(imageNamed: "paddle")
    var arrayOfBricks = [SKSpriteNode]()
    let bottomEdge = SKNode()
    
    // An action that will play my paddle sound effect
    var playFX: SKAction!
    
    // Defining categorys for bitmasks
    let ballCategory: UInt32       = 0x1      // 00000000000000000000000000000001, a.k.a. 1
    let paddleCategory: UInt32     = 0x1 << 1 // 00000000000000000000000000000010, a.k.a. 2
    let brickCategroy: UInt32      = 0x1 << 2 // 00000000000000000000000000000100, a.k.a. 4
    let edgeCategory: UInt32       = 0x1 << 3 // 00000000000000000000000000001000, a.k.a. 8
    let bottomEdgeCategory: UInt32 = 0x1 << 4 // 00000000000000000000000000010000, a.k.a. 16
    
    override func didMoveToView(view: SKView) {

        // Initialize scene settings
        backgroundColor = SKColor.blackColor()
        physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        physicsWorld.gravity = CGVector(dx: 0, dy: 0.01)
        physicsWorld.contactDelegate = self
        self.physicsBody?.categoryBitMask = edgeCategory
        playFX = SKAction.playSoundFileNamed("blip.caf", waitForCompletion: false)

        // Initialize ball sprite settings
        ball.position = CGPoint(x: size.width/2, y: size.height/2)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.frame.size.width/2)
        ball.physicsBody?.friction = 0
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.categoryBitMask = ballCategory
        ball.physicsBody?.contactTestBitMask = brickCategroy | paddleCategory | bottomEdgeCategory
        
        // Initialize paddle sprite settings
        paddle.position = CGPoint(x: size.width/2, y: 100)
        paddle.physicsBody = SKPhysicsBody(rectangleOfSize: paddle.size)
        paddle.physicsBody?.dynamic = false
        paddle.physicsBody?.categoryBitMask = paddleCategory
        
        // Create a array of bricks with initialized settings
        let numberOfBricksPerRow = 5
        for i in 1...numberOfBricksPerRow {
            let brick = SKSpriteNode(imageNamed: "brick")
            let xPosition = (size.width / CGFloat(numberOfBricksPerRow)) * (CGFloat(i) - 0.5)
            brick.position = CGPoint(x: xPosition, y: size.height - brick.size.height)
            brick.physicsBody = SKPhysicsBody(rectangleOfSize: brick.size)
            brick.physicsBody?.dynamic = false
            brick.physicsBody?.categoryBitMask = brickCategroy
            arrayOfBricks.append(brick)
        }
        
        // Initialize the bottom edge path
        bottomEdge.physicsBody = SKPhysicsBody(edgeFromPoint: CGPoint(x: 0, y: 1), toPoint: CGPoint(x: size.width, y: 1))
        bottomEdge.physicsBody?.categoryBitMask = bottomEdgeCategory
        
        
        // Add sprites to scene
        addChild(ball)
        addChild(paddle)
        for brick in arrayOfBricks {
            addChild(brick)
        }
        addChild(bottomEdge)

        // get the ball moving
        ball.physicsBody?.applyImpulse(CGVector(dx: 15, dy: 15))

    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        var notTheBall: SKPhysicsBody?
        
        // The ball's bitmask is a UInt32 with the value of 1. So...
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            notTheBall = contact.bodyB
        } else {
            notTheBall = contact.bodyA
        }
        
        if notTheBall?.categoryBitMask == brickCategroy {
            notTheBall?.node?.removeFromParent()
            self.runAction(SKAction.playSoundFileNamed("brickhit.caf", waitForCompletion: false))
        }
        
        if notTheBall?.categoryBitMask == paddleCategory {
            self.runAction(playFX)
        }
        
        if notTheBall?.categoryBitMask == bottomEdgeCategory {
            
            let endScene = EndScene(size: size)
//            endScene.scaleMode = .AspectFill
            
            let transition = SKTransition.doorsCloseHorizontalWithDuration(0.5)
            
            view?.presentScene(endScene, transition: transition)
        }
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch in touches {
            let t = touch as! UITouch
            let location = t.locationInNode(self)
            let halfOfPaddleWidth = paddle.size.width/2
            var newPosition = CGPoint(x: location.x, y: 100)
            if newPosition.x < halfOfPaddleWidth {
                newPosition.x = halfOfPaddleWidth
            }
            if newPosition.x > size.width - halfOfPaddleWidth {
                newPosition.x = size.width - halfOfPaddleWidth
            }
            paddle.position = newPosition
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
