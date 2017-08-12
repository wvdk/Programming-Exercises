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
        dump(shape)
        
        return SKNode()
    }
    
}
