//
//  GameScene.swift
//  Blink 2
//
//  Created by Wes Van der Klomp on 4/22/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        let blinkingDot = SKShapeNode(circleOfRadius: 30)
        blinkingDot.fillColor = SKColor.whiteColor()
        blinkingDot.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame))
        
        let hide = SKAction.hide()
        let show = SKAction.unhide()
        let wait = SKAction.waitForDuration(1)
        let blink = SKAction.sequence([show, wait, hide, wait])
        
        blinkingDot.runAction(SKAction.repeatActionForever(blink))
        
//        self.addChild(myLabel)
        self.addChild(blinkingDot)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
