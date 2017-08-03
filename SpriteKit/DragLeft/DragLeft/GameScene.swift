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
    
    private var rectNode: RectNode!
    
    var topLeftPoint: CGPoint!
    
    override func didMove(to view: SKView) {
        topLeftPoint = CGPoint(x: (frame.width / 2) * -1, y: frame.height / 2)
        
        rectNode = RectNode(rectOf: CGSize.init(width: 100, height: 30), cornerRadius: 0)
        
        rectNode.lineWidth = 10
    }
    
    func touchDown(atPoint pos : CGPoint) {
        addChild(rectNode)
        
        let rect = CGRect(x: 0, y: 0, width: Int(pos.x), height: Int(pos.y))
        
//        rectNode.position = topLeftPoint
        rectNode.path = CGPath(rect: rect, transform: nil)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        let rect = CGRect(x: 0, y: 0, width: Int(pos.x), height: Int(pos.y))
        
        rectNode.path = CGPath(rect: rect, transform: nil)
    }
    
    func touchUp(atPoint pos : CGPoint) {
        rectNode.removeFromParent()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
