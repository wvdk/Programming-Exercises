//
//  GameScene.swift
//  On Off 7
//
//  Created by Wes Van der Klomp on 4/25/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = SKColor.redColor()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        if self.backgroundColor == SKColor.redColor() {
            self.backgroundColor = SKColor.blueColor()
        } else {
            self.backgroundColor = SKColor.redColor()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
