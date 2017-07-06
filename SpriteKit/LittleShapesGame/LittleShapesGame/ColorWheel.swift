//
//  ColorWheel.swift
//  LittleShapesGame
//
//  Created by Wesley Van der Klomp on 7/5/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit

class ColorWheel: SKNode {
    override init() {
        super.init()
        
        let bezier3Path = NSBezierPath()
        bezier3Path.move(to: NSPoint(x: 43, y: 92))
        bezier3Path.line(to: NSPoint(x: 28, y: 92))
        bezier3Path.curve(to: NSPoint(x: 28, y: 77), controlPoint1: NSPoint(x: 28, y: 84.5), controlPoint2: NSPoint(x: 28, y: 77))
        bezier3Path.curve(to: NSPoint(x: 36.43, y: 79.59), controlPoint1: NSPoint(x: 31.12, y: 77), controlPoint2: NSPoint(x: 34.03, y: 77.96))
        bezier3Path.curve(to: NSPoint(x: 43, y: 92), controlPoint1: NSPoint(x: 40.39, y: 82.29), controlPoint2: NSPoint(x: 43, y: 86.84))
        bezier3Path.close()
        bezier3Path.move(to: NSPoint(x: 40.05, y: 73.32))
        bezier3Path.curve(to: NSPoint(x: 26, y: 69), controlPoint1: NSPoint(x: 36.04, y: 70.59), controlPoint2: NSPoint(x: 31.21, y: 69))
        bezier3Path.curve(to: NSPoint(x: 26, y: 94), controlPoint1: NSPoint(x: 26, y: 69), controlPoint2: NSPoint(x: 26, y: 81.5))
        bezier3Path.line(to: NSPoint(x: 51, y: 94))
        bezier3Path.curve(to: NSPoint(x: 40.05, y: 73.32), controlPoint1: NSPoint(x: 51, y: 85.4), controlPoint2: NSPoint(x: 46.66, y: 77.82))
        bezier3Path.close()
        
        let bluePart = SKShapeNode(path: bezier3Path.cgPath)
        bluePart.fillColor = SKColor.blue
        bluePart.lineWidth = 0.0
        
        addChild(bluePart)
        
        let spriteNode = SKSpriteNode(imageNamed: "ColorWheel")
        addChild(spriteNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
