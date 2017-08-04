//
//  CGRect+init(connecting to ).swift
//  DragLeft
//
//  Created by Wesley Van der Klomp on 8/4/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import CoreGraphics

extension CGRect {
    init(connecting pointA: CGPoint, to pointB: CGPoint) {
        let width = CGFloat(100)
        let height = CGFloat(100)
        
        self.init(x: pointA.x, y: pointA.y, width: width, height: height)
    }
}
