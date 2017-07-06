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
        
        let path = NSBezierPath()
        path.move(to: NSPoint(x: 0, y: -200))
        path.line(to: NSPoint(x: 0, y: -160))
        path.appendArc(withCenter: NSPoint.zero,
                       radius: 160.0,
                       startAngle: CGFloat(3.0 * (Double.pi / 2.0)),
                       endAngle: CGFloat(0),
                       clockwise: true)
        path.line(to: NSPoint(x: 200, y: 0))
        path.appendArc(withCenter: NSPoint.zero,
                       radius: 200,
                       startAngle: CGFloat(3.0),
                       endAngle: CGFloat(3.0 * (Double.pi / 2.0)),
                       clockwise: false)
        
        let bluePart = SKShapeNode(path: path.cgPath)
        bluePart.fillColor = SKColor.blue
        bluePart.lineWidth = 2.0
        
        addChild(bluePart)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
