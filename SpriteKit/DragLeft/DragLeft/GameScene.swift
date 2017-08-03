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
    
    private var rectNode = RectangleNode(rectOf: CGSize.init(width: 100, height: 30), cornerRadius: 0)
    
    var topLeftPoint: CGPoint!
    var bottomLeftPoint: CGPoint!
    var topRightPoint: CGPoint!
    var bottomRightPoint: CGPoint!

    override func didMove(to view: SKView) {
//        topLeftPoint = CGPoint(x: ((view.frame.width / 2) * -1) + 30, y: ((view.frame.height / 2) * -1) + 30)
    }

    // MARK: - Handle touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pos = touch.previousLocation(in: self)
            
//            let rect = CGRect(x: Int(topLeftPoint.x), y: Int(topLeftPoint.y), width: Int(pos.x), height: Int(pos.y))
            
//            rectNode.position = topLeftPoint
//            rectNode.path = CGPath(rect: rect, transform: nil)
            
            addChild(rectNode)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
//            let
//            let rect = CGRect(x: Int(topLeftPoint.x), y: Int(topLeftPoint.y), width: Int(pos.x), height: Int(pos.y))
//
//            rectNode.path = CGPath(rect: rect, transform: nil)
        
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
}
