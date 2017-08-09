//
//  Slider.swift
//  Slider
//
//  Created by Wesley Van der Klomp on 8/9/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

struct Slider {
    
    private let knob: SliderKnob
    private let track: SliderTrack
    
    let node: SKNode
    
    init() {
        knob = SliderKnob(position: CGPoint(x: 0, y: 0))
        track = SliderTrack(position: CGPoint(x: 0, y: 0))
        node = SKNode()
        
        node.addChild(knob.node)
        node.addChild(track.node)
    }
    
}
