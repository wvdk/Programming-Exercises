//
//  RectNode.swift
//  DragLeft
//
//  Created by Wesley Van der Klomp on 8/3/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import UIKit
import SpriteKit

class RectNode: SKShapeNode {
    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    override var position: CGPoint {
        set {
            super.position = CGPoint(x: self.position.x - self.frame.size.width * self.anchorPoint.x, y: self.position.y - self.frame.size.height * self.anchorPoint.y)
        }
        get {
            return super.position
        }
    }
}
