//
//  MovableRect.swift
//  Draw
//
//  Created by Wes Van der Klomp on 5/19/15.
//
//

import SpriteKit

class MovableRect: SKShapeNode {
    
    override init() {
        super.init()
        
        self.path = CGPathCreateWithRect(CGRect(x: 0, y: 0, width: 30, height: 30), nil)
        self.fillColor = SKColor.redColor()
        self.position = CGPoint(x: 100, y: 100) // TODO: fix these magic numbers
    }
    
    convenience init(position: CGPoint) {
        self.init()

        self.position = position
        println("used special init")
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
