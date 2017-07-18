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
    private var randomPointWithinViewFrame: CGPoint {
        get {
            let halfWidth = UInt32(frame.width / 2)
            let x = arc4random_uniform(UInt32(self.frame.width))
            
            let halfHeight = UInt32(frame.height / 2)
            let y = arc4random_uniform(UInt32(self.frame.height))
            
            return CGPoint(x: Int(x) - Int(halfWidth), y: Int(y) - Int(halfHeight))
        }
    }
    
    override func didMove(to view: SKView) {
        player = childNode(withName: "//Player") as? SKSpriteNode
        spikey = SKSpriteNode(imageNamed: "Spikey")
        
        spikey.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2)))
        
        createSpikeysAllOver()
    }
    
    func createSpikeysAllOver() {
        addChild(spikey)
//        if let newSpikey = spikey.copy() as? SKSpriteNode {
//            newSpikey.position = randomPointWithinViewFrame
//
//            self.addChild(newSpikey)
//        }
    }
    
    override func mouseDown(with event: NSEvent) {
        player.position = event.location(in: self)
        spikey.position = randomPointWithinViewFrame
    }
    
    override func mouseDragged(with event: NSEvent) {
        player.position = event.location(in: self)
    }
    
    override func mouseUp(with event: NSEvent) {
        player.run(SKAction(named: "Pulse")!)
    }
    
}
