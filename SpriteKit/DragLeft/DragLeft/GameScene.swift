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
    var topRightRectNode: RectangleNode!
    var bottomLeftRectNode: RectangleNode!
    var bottomRightRectNode: RectangleNode!

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

        // Initialize rects
        topLeftRectNode = RectangleNode(rect: CGRect(connecting: topLeftPoint, to: centerPoint))
        topRightRectNode = RectangleNode(rect: CGRect(connecting: topRightPoint, to: centerPoint))
        bottomLeftRectNode = RectangleNode(rect: CGRect(connecting: bottomLeftPoint, to: centerPoint))
        bottomRightRectNode = RectangleNode(rect: CGRect(connecting: bottomRightPoint, to: centerPoint))

        addChild(topLeftRectNode)
        addChild(topRightRectNode)
        addChild(bottomLeftRectNode)
        addChild(bottomRightRectNode)
    }

    func updateRects(using point: CGPoint) {
        let offSet = CGFloat(10)
        
        let topLeftRectNodesOffsettedEndPoint = CGPoint(x: point.x - offSet, y: point.y + offSet)
        let topRightRectNodesOffsettedEndPoint = CGPoint(x: point.x +  offSet, y: point.y + offSet)
        let bottomLeftRectNodesOffsettedEndPoint = CGPoint(x: point.x - offSet, y: point.y - offSet)
        let bottomRightRectNodesOffsettedEndPoint = CGPoint(x: point.x + offSet, y: point.y - offSet)

        topLeftRectNode.path =  CGPath(rect: CGRect(connecting: topLeftPoint, to: topLeftRectNodesOffsettedEndPoint), transform: nil)
        topRightRectNode.path =  CGPath(rect: CGRect(connecting: topRightPoint, to: topRightRectNodesOffsettedEndPoint), transform: nil)
        bottomLeftRectNode.path =  CGPath(rect: CGRect(connecting: bottomLeftPoint, to: bottomLeftRectNodesOffsettedEndPoint), transform: nil)
        bottomRightRectNode.path =  CGPath(rect: CGRect(connecting: bottomRightPoint, to: bottomRightRectNodesOffsettedEndPoint), transform: nil)
    }
    
    // MARK: - Handle touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            updateRects(using: touch.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            updateRects(using: touch.location(in: self))
        }
    }

}
