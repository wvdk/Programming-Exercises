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
    
    /// A SliderNode (subclass of SKShapeNode) for adding to a SpriteKit scene.
    ///
    /// Things like position, size, or color are all updated automatically when you change the properties of a `Slider` instance. So you should rarely need to set properties of this `node` property directly.
    let node: SliderNode
    
    /// The position of the slider in it's parents coordinate system.
    var position = CGPoint(x: 0, y: 0) {
        didSet {
            node.position = position
        }
    }
 
    /// The size of the slider.
    var size = CGSize(width: 300, height: 100) {
        didSet {
             // TODO: update the nodes with new size
        }
    }
    
    /// Calculated center point of the slider.
    private var center: CGPoint {
        return CGPoint(x: size.width / 2, y: size.height / 2)
    }
    
    private let knob = SliderKnob()
    
    private let track = SliderTrack()
    
    /// Creates a Slider which containts a knob and track.
    init() {
        node = SliderNode(rect: CGRect(origin: position, size: size))
        
        knob.position = center
        track.position = center
        
        node.isUserInteractionEnabled = true
        node.owner = self
        
        node.addChild(track.node)
        node.addChild(knob.node)
    }
    
    func click(at point: CGPoint) {
        let knobOriginalPosition = knob.position
        let knobNewPosition = CGPoint(x: point.x, y: knobOriginalPosition.y)
        
        knob.position = knobNewPosition
    }
    
    func dragging(currentPoint: CGPoint) {
        let knobOriginalPosition = knob.position
        let knobNewPosition = CGPoint(x: currentPoint.x, y: knobOriginalPosition.y)
        
        knob.position = knobNewPosition
    }
    
}
