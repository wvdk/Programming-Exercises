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
    
    private var player: SKSpriteNode!
    private var spikey: SKSpriteNode!
    private var randomPointWithingViewFrame: CGPoint {
        get {
            return CGPoint(x: 0, y: 0)
        }
    }
    
    override func didMove(to view: SKView) {
        player = childNode(withName: "//Player") as? SKSpriteNode
        spikey = SKSpriteNode(imageNamed: "Spikey")
        
        spikey.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2)))
        
        createSpikeysAllOver()
    }
    
    func createSpikeysAllOver() {
        
        if let newSpikey = spikey.copy() as? SKSpriteNode {
            newSpikey.position = randomPointWithingViewFrame
            
            self.addChild(newSpikey)
        }
    }
    
    override func mouseDown(with event: NSEvent) {
        player.position = event.location(in: self)
    }
    
    override func mouseDragged(with event: NSEvent) {
        player.position = event.location(in: self)
    }
    
    override func mouseUp(with event: NSEvent) {
        player.run(SKAction(named: "Pulse")!)
    }
    
}
