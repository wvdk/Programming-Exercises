//
//  MyScene.swift
//  LearningActions
//
//  Created by Wesley Van der Klomp on 7/6/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit

class MyScene: SKScene {
    
    var player: SKShapeNode!
    
    override func didMove(to view: SKView) {
        player = childNode(withName: "Player") as! SKShapeNode
    }
    
    override func keyDown(with event: NSEvent) {
        player.run(SKAction(named: "Jump")!)
    }
    
}
