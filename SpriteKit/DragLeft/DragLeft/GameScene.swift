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
    
    var topLeftRectNode: RectangleNode!
    
    var topLeftPoint: CGPoint!
    var bottomLeftPoint: CGPoint!
    var topRightPoint: CGPoint!
    var bottomRightPoint: CGPoint!
    var centerPoint: CGPoint!

    override func didMove(to view: SKView) {
        
        // Initialize corner point values
        let width = frame.width
        let height = frame.height
        let leftSide = (width / 2) * -1
        let rightSide = width / 2
        let top = height / 2
        let bottom = (height / 2) * -1
        
        topLeftPoint = CGPoint(x: leftSide, y: top)
        topRightPoint = CGPoint(x: rightSide, y: top)
        bottomLeftPoint = CGPoint(x: leftSide, y: bottom)
        bottomRightPoint = CGPoint(x: rightSide, y: bottom)
        centerPoint = CGPoint(x: 0, y: 0)

        // Set up rects
        
        topLeftRectNode = RectangleNode(rect: CGRect(connecting: topLeftPoint, to: centerPoint))
        
        addChild(topLeftRectNode)
    }

    // MARK: - Handle touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let firstPoint = topLeftPoint!
            let secondPoint = touch.location(in: self)
            let rect = CGRect(connecting: firstPoint, to: secondPoint)
            let path = CGPath(rect: rect, transform: nil)
            
            topLeftRectNode.path = path
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let firstPoint = topLeftPoint!
            let secondPoint = touch.location(in: self)
            let rect = CGRect(connecting: firstPoint, to: secondPoint)
            let path = CGPath(rect: rect, transform: nil)
            
            topLeftRectNode.path = path
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        topLeftRectNode.run(SKAction(named: "ReturnToCenter")!)
    }

}
