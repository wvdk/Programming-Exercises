//
//  SliderKnob.swift
//  Slider
//
//  Created by Wesley Van der Klomp on 8/8/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit

/// The part of a slider than the user clicks on and drags in order to change the value.
struct SliderKnob {
    
    /// An SKShapeNode for adding to a SpriteKit scene.
    let node: SKShapeNode
    
    /// The position of the knob in it's parents coordinate system. Also used to calculate the slider's value.
    var position: CGPoint {
        didSet {
            node.position = position
        }
    }
    
    /// Creates a knob at `position`.
    init(position: CGPoint) {
        self.position = position
        
        node = SKShapeNode(circleOfRadius: 30)
        
        node.fillColor = SKColor.white
        node.position = position
    }
    
}
