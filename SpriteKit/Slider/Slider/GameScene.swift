//
//  GameScene.swift
//  Slider
//
//  Created by Wesley Van der Klomp on 8/8/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var label = Label(text: "123", position: CGPoint(x: 0, y: 100))
    var slider = Slider()


    override func didMove(to view: SKView) {
        label.position = CGPoint(x: frame.width / 2, y: frame.height / 2 + 100)
        slider.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        addChild(label.node)
        addChild(slider.node)
    }
    
    override func mouseDown(with event: NSEvent) {
//        let xPosition = event.locationInWindow.x
//
//        sliderKnob.position.x = xPosition
    }
    
    override func mouseDragged(with event: NSEvent) {
//        let xPosition = event.locationInWindow.x
//
//        slider.position.x = xPosition
    }
    
    override func mouseUp(with event: NSEvent) {
//        sliderKnob.position = CGPoint(x: 0, y: 0)
    }
    
}
