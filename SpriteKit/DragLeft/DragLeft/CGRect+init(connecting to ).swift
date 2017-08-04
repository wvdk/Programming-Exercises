//
//  CGRect+init(connecting to ).swift
//  DragLeft
//
//  Created by Wesley Van der Klomp on 8/4/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import CoreGraphics

extension CGRect {
    
    /// Creates an instance of a rectangle with two of it's corners located at the a and b points.
    init(connecting pointA: CGPoint, to pointB: CGPoint) {
        let width =  pointA.x - pointB.x
        let height = CGFloat(100)
        
        self.init(x: pointA.x, y: pointA.y, width: width, height: height)
    }
    
}
