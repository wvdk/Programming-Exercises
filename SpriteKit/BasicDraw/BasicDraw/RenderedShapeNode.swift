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
        print("mouse down...")
    }
    
    override func mouseDragged(with event: NSEvent) {
        print("mouse moved...")
    }
    
}
