//
//  GameScene.swift
//  Grid 3
//
//  Created by Wes Van der Klomp on 4/27/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let numberOfColumns = 6
        let numberOfRows = 10
        let columnSpacing = Int(view.frame.width) / numberOfColumns
        let rowSpacing = Int(view.frame.height) / numberOfRows
        
        for c in 0...numberOfColumns {
            for r in 0...numberOfRows {
                let square = SKShapeNode(rect: CGRect(x: c * columnSpacing, y: r * rowSpacing, width: columnSpacing, height: rowSpacing))
                square.fillColor = SKColor.whiteColor()
                square.strokeColor = SKColor.blackColor()
                self.addChild(square)
            }
        }
    }
}
