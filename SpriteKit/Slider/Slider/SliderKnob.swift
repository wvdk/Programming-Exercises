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
class SliderKnob {
    
    /// An SKShapeNode for adding to a SpriteKit scene.
    ///
    /// Things like position, size, or color are all updated automatically when you change the properties of a `SliderKnob` instance. So you should rarely need to set properties of this `node` property directly.
    let node: SliderKnobNode
    
    /// The position of the knob in it's parents coordinate system. Also used to calculate the slider's value.
    var position: CGPoint {
        didSet {
            node.position = position
        }
    }
    
    func click(at point: CGPoint) {
        print("there has been a click at \(point)")
        
        
    }
    
    /// Creates a knob at `position`.
    init(position: CGPoint) {
        self.position = position
        
        node = SliderKnobNode(circleOfRadius: 30)
        
        node.owner = self
        node.isUserInteractionEnabled = true
        node.fillColor = SKColor.white
        node.position = position
    }
    
}
