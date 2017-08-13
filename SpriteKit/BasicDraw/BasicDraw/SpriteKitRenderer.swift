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
        let topLevelNode = SKShapeNode(rect: rect)
        
        topLevelNode.fillColor = .blue
        
        dump(shape)
        
        
        for childShape in shape.children {
            let rect = CGRect(x: childShape.position.x, y: childShape.position.y, width: childShape.size.width, height: childShape.size.height)
            let childNode = SKShapeNode(rect: rect)
            
            topLevelNode.addChild(childNode)
            
        }
        
       
        
        return topLevelNode
    }
    
}
