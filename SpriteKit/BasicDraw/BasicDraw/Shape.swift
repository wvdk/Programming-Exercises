//
//  Shape.swift
//  BasicDraw
//
//  Created by Wesley Van der Klomp on 8/12/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

/*

 Coordinate system:
 
                     (x: 10, y: 10)
         |-----------
         |-----------
         |-----------
         |___________
(x: 0, y: 0)
 
 */
struct Shape {
    
    let size: CGSize
    
    /// Relative to parent
    let position: CGPoint
    
    /// An array containing normal Shapes or recursive Shapes
    var children: [Shape] = []
    
    // On hold:
//    var childTransforms: [ShapeTransform] = []
    
    
}
