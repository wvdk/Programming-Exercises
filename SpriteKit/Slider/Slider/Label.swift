//
//  Label.swift
//  Slider
//
//  Created by Wesley Van der Klomp on 8/8/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

/// A label for displaying text on screen.
struct Label {
    
    /// The string that the label displays.
    var text: String
    
    /// The position point of the label within it's parent's coordinate system.
    var position: CGPoint
    
    /// A SKLabelNode for adding to a SpriteKit scene.
    var node: SKLabelNode {
        let n = SKLabelNode()
        
        n.text = text
        n.position = position
        
        return n
    }
    
}
