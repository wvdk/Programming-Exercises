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
    
    private var rectNode = RectangleNode(rectOf: CGSize(width: 200, height: 100), cornerRadius: 0)
    
    var topLeftPoint: CGPoint!
    var bottomLeftPoint: CGPoint!
    var topRightPoint: CGPoint!
    var bottomRightPoint: CGPoint!

    override func didMove(to view: SKView) {
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

        
        let firstPoint = topLeftPoint!
        let secondPoint = CGPoint(x: 0, y: 0)
        let rect = CGRect(connecting: firstPoint, to: secondPoint)
        let path = CGPath(rect: rect, transform: nil)
        
        rectNode.path = path
        
        addChild(rectNode)
    }

    // MARK: - Handle touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let firstPoint = topLeftPoint!
            let secondPoint = touch.location(in: self)
            let rect = CGRect(connecting: firstPoint, to: secondPoint)
            let path = CGPath(rect: rect, transform: nil)
            
            rectNode.path = path
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let firstPoint = topLeftPoint!
            let secondPoint = touch.location(in: self)
            let rect = CGRect(connecting: firstPoint, to: secondPoint)
            let path = CGPath(rect: rect, transform: nil)
            
            rectNode.path = path
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        rectNode.run(SKAction(named: "ReturnToCenter")!)
    }

}
