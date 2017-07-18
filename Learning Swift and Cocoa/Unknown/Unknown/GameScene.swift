//
//  GameScene.swift
//  Unknown
//
//  Created by Wesley Van der Klomp on 7/18/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var player: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        player = childNode(withName: "//Player") as? SKSpriteNode
    }
    
    override func mouseDown(with event: NSEvent) {
        if let player = player {
            player.run(SKAction(named: "Pulse")!)
            player.position = event.location(in: self)
        }
    }
    
    override func mouseDragged(with event: NSEvent) {
        
    }
    
    override func mouseUp(with event: NSEvent) {
    }
}
