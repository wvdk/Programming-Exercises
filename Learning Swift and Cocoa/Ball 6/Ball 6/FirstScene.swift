//
//  GameScene.swift
//  Ball 6
//
//  Created by Wes Van der Klomp on 5/10/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit

class FirstScene: SKScene {
    let ball = Ball()
    
    override func didMoveToView(view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFromRect: frame)
        self.addChild(ball)
    }
}
