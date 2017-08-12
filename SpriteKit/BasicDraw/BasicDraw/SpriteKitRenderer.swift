//
//  SpriteKitRenderer.swift
//  BasicDraw
//
//  Created by Wesley Van der Klomp on 8/12/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

/// Turns a Shape data structure into an SKNodes hirerarchy
struct SpriteKitRenderer: Renderer {
    
    typealias Render = SKNode
    
    func render(shape: Shape) -> Render {

        let rect = CGRect(x: shape.position.x, y: shape.position.y, width: shape.size.width, height: shape.size.height)
        let n = SKShapeNode(rect: rect)
        
        n.fillColor = .blue
        
        dump(shape)
        
        return n
    }
    
}
