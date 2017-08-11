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
class Label {
    
    /// The string that the label displays.
    var text = "Hello" {
        didSet {
            updateNode()
        }
    }
    
    /// The position point of the label within it's parent's coordinate system.
    var position = CGPoint(x: 0, y: 0)
    
    /// A SKLabelNode for adding to a SpriteKit scene.
    var node = SKLabelNode()
    
    private func updateNode() {
        let n = SKLabelNode()
        
        n.text = text
        n.position = position
        n.fontColor = .black
        
        node = n
    }
    
}
