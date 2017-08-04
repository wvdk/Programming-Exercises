//
//  CGRect+init(connecting to ).swift
//  DragLeft
//
//  Created by Wesley Van der Klomp on 8/4/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import CoreGraphics

extension CGRect {
    
    /// Creates a rectangle with corners reaching from `pointA` to `pointB`.
    init(connecting pointA: CGPoint, to pointB: CGPoint) {
        let width =  pointB.x - pointA.x
        let height =  pointB.y - pointA.y
        
        self.init(x: pointA.x, y: pointA.y, width: width, height: height)
    }
    
}
