//
//  SliderNode.swift
//  Slider
//
//  Created by Wesley Van der Klomp on 8/10/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

class SliderNode: SKShapeNode {
    
    var owner: Slider? = nil
    
    override func mouseDown(with event: NSEvent) {
        print("mouseDown, SliderNode")
        
//        if let owner = owner {
//            owner.moveKnob(to: event.location(in: owner.node))
//        }
    }
    
}
