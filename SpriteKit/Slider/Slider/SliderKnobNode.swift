//
//  SliderKnobNode.swift
//  Slider
//
//  Created by Wesley Van der Klomp on 8/10/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

class SliderKnobNode: SKShapeNode {
    
    var owner: SliderKnob? = nil

    override func mouseDown(with event: NSEvent) {
        print("mouseDown, SliderKnobNode")
        
        if let owner = owner {
            owner.click(at: event.location(in: self))
        }
    }
    
}
