//
//  Slider.swift
//  Slider
//
//  Created by Wesley Van der Klomp on 8/9/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

/// A user interface which the user can select and drag a knob to change a value.
struct Slider {
    
    private let knob: SliderKnob
    private let track: SliderTrack
    
//    var valueRange: Range<Int>
    
    var value: Int
    
    let node: SKNode
    
    init() {
        knob = SliderKnob(position: CGPoint(x: 0, y: 0))
        track = SliderTrack(position: CGPoint(x: 0, y: 0))
        value = 50
        node = SKNode()
        
        node.addChild(knob.node)
        node.addChild(track.node)
    }
    
}
