//
//  ColorSelectionButton.swift
//  LittleShapesGame
//
//  Created by Wesley Van der Klomp on 7/4/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit

class ColorSelectionButton: SKShapeNode {
    override init() {
        super.init()
        
        let rect = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.path = CGPath(rect: rect, transform: nil)
        self.fillColor = SKColor.red
        self.lineWidth = 0.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
