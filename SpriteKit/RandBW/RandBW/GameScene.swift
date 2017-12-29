//
//  GameScene.swift
//  RandBW
//
//  Created by Wesley Van der Klomp on 12/29/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    lazy var spin = SKAction(named: "Spin")!
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        let myFirstNode = SKSpriteNode()
        myFirstNode.color = .white
        myFirstNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        myFirstNode.size = CGSize(width: 100, height: 100)
        
        self.addChild(myFirstNode)
        
        myFirstNode.run(spin)
    }
    
}
