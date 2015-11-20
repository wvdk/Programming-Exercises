//
//  GameScene.swift
//  Blink 3
//
//  Created by Wes Van der Klomp on 4/23/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = SKColor.blackColor()
        
        let blinkingSquare = SKShapeNode(rect: CGRect(x: CGRectGetMidX(frame) - 15, y: CGRectGetMidY(frame) - 15, width: 30, height: 30))
        blinkingSquare.fillColor = SKColor.redColor()
        blinkingSquare.strokeColor = SKColor.redColor()
        
        let hide = SKAction.hide()
        let unhide = SKAction.unhide()
        let wait = SKAction.waitForDuration(1)
        let sequence = SKAction.sequence([hide, wait, unhide, wait])
        
        blinkingSquare.runAction(SKAction.repeatActionForever(sequence))
        
        self.addChild(blinkingSquare)
    }
       
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
