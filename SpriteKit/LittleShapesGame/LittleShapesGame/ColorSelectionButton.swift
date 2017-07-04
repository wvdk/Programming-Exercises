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
    
    var selected = false
    var delegate: ButtonSelectionDelegate?
    
    override init() {
        super.init()
        
        let rect = CGRect(x: 0, y: 0, width: 30, height: 30)
        path = CGPath(rect: rect, transform: nil)
        fillColor = SKColor.red
        isUserInteractionEnabled = true
        
        if selected {
            lineWidth = 1.0
        } else {
            lineWidth = 0.0
        }
    }
    
    override func mouseDown(with event: NSEvent) {
        if let delegate = delegate {
            delegate.attemptingSelection(of: self)
        } else {
            if selected {
                lineWidth = 0.0
                
                selected = false
            } else {
                lineWidth = 1.0
                
                selected = true
            }
        }
    }
    
    override func touchesBegan(with event: NSEvent) {
        print(event)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
