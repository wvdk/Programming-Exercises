//
//  SliderTrack.swift
//  Slider
//
//  Created by Wesley Van der Klomp on 8/8/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

/// The line for showing the angle the user my drag the knob along.
struct SliderTrack {
    
    /// An SKShapeNode for adding to a SpriteKit scene.
    var node: SKShapeNode {
        let rect = CGRect(x: position.x, y: position.y, width: 100, height: 10)
        let n = SKShapeNode(rect: rect, cornerRadius: 4)
        
        n.fillColor = SKColor.white
        n.position = position
        
        return n
    }
    
    /// The position of the knob in it's parents coordinate system. Also used to calculate the slider's value.
    var position: CGPoint
}

