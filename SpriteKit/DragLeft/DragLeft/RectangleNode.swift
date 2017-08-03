//
//  RectangleNode.swift
//  DragLeft
//
//  Created by Wesley Van der Klomp on 8/3/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import UIKit
import SpriteKit

class RectangleNode: SKShapeNode {
    
    /// Defines the point in the node's frame that should act as the center point for the node’s position.
    ///
    /// A value of (0.0, 0.0) is the top left and (1.0, 1.0) is bottom right. Defaults to 0.5, 0.5 which dead center. Set `anchorPoint`, then set the `position` property to see effects. Works much like `SKSpriteNode`'s implementation, so see "Using the Anchor Point to Move the Sprite Node’s Frame" in `SKSpriteNode` documentation.
    var anchorPoint = CGPoint(x: 1.0, y: 1.0)
    
    /// Creates an instance with line width and stoke color set to reasonable defaults.
    override init() {
        super.init()
        
        lineWidth = 8.0
        strokeColor = SKColor.white
    }
    
    /// Warning: Not fully implemented.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// The position of the node in its parent's coordinate system, taking `anchorPoint` into account.
    override var position: CGPoint {
        set {
            let x = newValue.x
            let y = newValue.y
            let width = frame.size.width
            let height = frame.size.height
            let xOffset = width * anchorPoint.x
            let yOffset = height * anchorPoint.y
            let xAdjusted = x + xOffset
            let yAdjusted = y + yOffset
            
            super.position = CGPoint(x: xAdjusted, y: yAdjusted)
        }
        get {
            return super.position
        }
    }
}
