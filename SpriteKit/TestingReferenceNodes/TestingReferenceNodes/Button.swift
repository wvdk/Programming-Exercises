//
//  Button.swift
//  TestingReferenceNodes
//
//  Created by Wesley Van der Klomp on 7/11/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit

class Button: SKSpriteNode {
    
    override func touchesBegan(with event: NSEvent) {
        print("touch")
    }
    
    override func mouseDown(with event: NSEvent) {
        print("click")
    }
    
}
