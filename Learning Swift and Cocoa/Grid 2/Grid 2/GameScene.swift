//
//  GameScene.swift
//  Grid 2
//
//  Created by Wes Van der Klomp on 4/26/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        func createDot(position: CGPoint) -> SKShapeNode {
            let hide = SKAction.hide()
            let unhide = SKAction.unhide()
            let wait = SKAction.waitForDuration(1, withRange: 10)
            let blink = SKAction.repeatActionForever(SKAction.sequence([hide, wait, unhide, wait]))
            
            let dot = SKShapeNode(circleOfRadius: 5)
            dot.strokeColor = SKColor.cyanColor()
            dot.fillColor = SKColor.cyanColor()
            dot.position = position
            dot.runAction(blink)
            return dot
        }
        
        let numberOfColumns = 15
        let columnSpacing = Int(frame.size.width) / numberOfColumns
        let numberOfRows = 15
        let rowSpacing = Int(frame.size.height) / numberOfRows
        
        for column in 0...numberOfColumns {
            for row in 0...numberOfRows {
                addChild(createDot(CGPoint(x: columnSpacing * column, y: rowSpacing * row)))
            }
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
