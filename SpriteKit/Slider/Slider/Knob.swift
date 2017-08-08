//
//  Knob.swift
//  Slider
//
//  Created by Wesley Van der Klomp on 8/8/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit

/// The part of a slider than the user clicks on and drags in order to change the value.
struct Knob {
    
    /// An SKShapeNode for adding to a SpriteKit scene.
    var node: SKShapeNode {
        let n = SKShapeNode(circleOfRadius: 30)
        
        n.position = position
        
        return n
    }
    
    /// The position of the knob in it's parents coordinate system. Also used to calculate the slider's value.
    var position: CGPoint
    
    
}
