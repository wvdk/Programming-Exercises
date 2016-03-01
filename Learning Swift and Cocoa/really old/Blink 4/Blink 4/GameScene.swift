//
//  GameScene.swift
//  Blink 4
//
//  Created by Wes Van der Klomp on 4/26/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let black = SKAction.colorizeWithColor(SKColor.blackColor(), colorBlendFactor: 0, duration: 0)
        let wait = SKAction.waitForDuration(1)
        let white = SKAction.colorizeWithColor(SKColor.whiteColor(), colorBlendFactor: 0, duration: 0)
        let seq = SKAction.sequence([black, wait, white, wait])
        
        self.runAction(SKAction.repeatActionForever(seq))
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
        
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
