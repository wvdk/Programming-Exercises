//
//  ViewController.swift
//  BasicDraw
//
//  Created by Wesley Van der Klomp on 8/11/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    var shapesInventory: ShapesInventory = [:]
    var rootShape: ShapeName?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = CGSize(width: 100, height: 100)
        let shapePosition = CGPoint(x: 100, y: 100)
        
        shapesInventory["square"] = Shape(size: size, position: shapePosition, children: ["square"])
        
        
        
        
        
        
        
//        let renderer = SpriteKitRenderer()
        
//        let rendered = renderer.render(shape: myShape)
        
//        addChild(rendered)
        
        
        
        
        

        if let view = self.skView {            
            let scene = GameScene(size: view.frame.size)
            
            scene.scaleMode = .aspectFit
            
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}

