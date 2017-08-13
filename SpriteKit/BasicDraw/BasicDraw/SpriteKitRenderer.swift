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
        let shapeX = shape.position.x
        let shapeY = shape.position.y
        let rect = CGRect(x: shapeX, y: shapeY, width: shape.size.width, height: shape.size.height)
        let shapeNode = SKShapeNode(rect: rect)
        
        shapeNode.fillColor = .blue
        
        for childShape in shape.children {
            let childNode = render(shape: childShape)
            
            childNode.position = CGPoint(x: shapeY, y: shapeX)
            
           shapeNode.addChild(childNode)
        }
        
        return shapeNode
    }
    
}
