//
//  GameViewController.swift
//  1
//
//  Created by Wesley Van der Klomp on 10/22/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import SceneKit

class GameViewController: NSViewController {
    
    @IBOutlet weak var myGameView: SCNView!
    
    override func awakeFromNib() {
        let scene = SCNScene()
        myGameView.backgroundColor = NSColor.blackColor()
        
        let camNode = SCNNode()
        camNode.camera = SCNCamera()
        camNode.position = SCNVector3Make(150/4, 150/4, 75)
        scene.rootNode.addChildNode(camNode)
        
        let columns = 150
        for i1 in 1...columns {
            let rows = 150
            for i2 in 1...rows {
                let pixl = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
                pixl.firstMaterial?.diffuse.contents = NSColor.whiteColor()
                let pixlNode = SCNNode(geometry: pixl)
                pixlNode.position = SCNVector3Make((CGFloat(i2) * 0.5) - 0.5, (CGFloat(i1) * 0.5) - 0.5, 0)
                scene.rootNode.addChildNode(pixlNode)
            }
        }
        
        self.myGameView!.scene = scene
//        self.myGameView!.allowsCameraControl = true
//        self.myGameView!.showsStatistics = true
    }
}
