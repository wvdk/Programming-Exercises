//
//  Card.swift
//  Prep SCNNodes
//
//  Created by Wesley Van der Klomp on 5/31/19.
//  Copyright © 2019 wes. All rights reserved.
//

import SceneKit

class Card: SCNNode {
    
    required override init() {
        super.init()
        
        // Create rounded rect node
        let aspectRatio = 0.8
        let backgroundHeight = 0.375
        let backgroundWidth = backgroundHeight*aspectRatio
        let backgroundNode = SCNNode()
        let backgroundPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: backgroundWidth, height: backgroundHeight), cornerRadius: 0.045)
        backgroundPath.flatness = 0.0
        let backgroundShape = SCNShape(path: backgroundPath, extrusionDepth: 0.005)
        backgroundNode.geometry = backgroundShape
        backgroundNode.position = SCNVector3(-backgroundWidth/2, -backgroundHeight/2, 0.0)
        addChildNode(backgroundNode)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
