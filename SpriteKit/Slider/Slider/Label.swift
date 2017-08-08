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
    
    /// The text to be displayed by the label.
    var text: String
    
    /// A SKLabelNode for adding to a SpriteKit scene.
    var node: SKLabelNode {
        let n = SKLabelNode()
        
        return n
    }
    
}
