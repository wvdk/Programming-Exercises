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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let size = CGSize(width: 100, height: 100)
        let shapePosition = CGPoint(x: 100, y: 100)
        var myShape = Shape(size: size, position: shapePosition, children: [])
        
        myShape.children = [myShape]
        myShape.children = [myShape]
        
        let renderer = SpriteKitRenderer()
        
        let rendered = renderer.render(shape: myShape)
        
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

