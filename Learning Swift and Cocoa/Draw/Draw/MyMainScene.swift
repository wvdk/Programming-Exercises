//
//  GameScene.swift
//  Draw
//
//  Created by Wes Van der Klomp on 5/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

import SpriteKit

class MyMainScene: SKScene {
    override func didMoveToView(view: SKView) {
        println("MyMainScene is running")
        
        let testThing = MovableRect()
        let anotherTestThing = MovableRect(position: CGPoint(x: 100, y: 300))
        
        addChild(anotherTestThing)
        addChild(testThing)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        let newRect = MovableRect(position: theEvent.locationInNode(self))
        addChild(newRect)
    }
    
    override func update(currentTime: CFTimeInterval) {

    }
}
