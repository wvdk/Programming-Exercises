//
//  GameScene.swift
//  DragLeft
//
//  Created by Wesley Van der Klomp on 8/3/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var rectNode = RectangleNode(rectOf: CGSize.init(width: 200, height: 100), cornerRadius: 0)
    
    var topLeftPoint: CGPoint!
    var bottomLeftPoint: CGPoint!
    var topRightPoint: CGPoint!
    var bottomRightPoint: CGPoint!

    override func didMove(to view: SKView) {

        // TODO: Initialize values for corner points.
        
        addChild(rectNode)

    }

    // MARK: - Handle touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            rectNode.position = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            rectNode.position = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        rectNode.run(SKAction(named: "ReturnToCenter")!)
    }

}
