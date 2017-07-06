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
    
    override func didMove(to view: SKView) {
        let player = childNode(withName: "Player")
        player?.run(SKAction.fadeOut(withDuration: 3))
    }
    
}
