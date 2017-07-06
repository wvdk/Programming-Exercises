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
        if let characters = event.characters {
            switch characters {
            case " ", "w":
                print("Space or W")
                player.run(SKAction(named: "Jump")!)
            case "a":
                print("D")
                player.run(SKAction(named: "Move Left")!)
            case "d":
                print("D")
                player.run(SKAction(named: "Move Right")!)
            default:
                print("Other")
            }
        }
        
        
    }
    
}
