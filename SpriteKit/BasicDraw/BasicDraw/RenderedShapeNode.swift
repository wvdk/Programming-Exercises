//
//  RenderedShapeNode.swift
//  BasicDraw
//
//  Created by Wesley Van der Klomp on 8/14/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

class RenderedShapeNode: SKShapeNode {
    
    override func mouseDown(with event: NSEvent) {
        movePosition(event: event)
    }
    
    override func mouseDragged(with event: NSEvent) {
        movePosition(event: event)
    }
    
    private func movePosition(event: NSEvent) {
        print("move on shape named \"\(name)\"")
        
        if let scene = scene {
            let p = event.location(in: scene)
            
            self.position = p
        }
    }
    
}
