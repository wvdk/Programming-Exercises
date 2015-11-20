//
//  EndScene.swift
//  BrickBreaker
//
//  Created by Wes Van der Klomp on 2/28/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import SpriteKit

class EndScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blueColor()
        
        let sorryMsg = SKLabelNode(text: "GAME OVER")
        sorryMsg.position = CGPoint(x: size.width/2, y: size.height/2)
        
        addChild(sorryMsg)
        
        let tryAgainMsg = SKLabelNode(text: "Tap to try again.")
        tryAgainMsg.fontSize = 26
        tryAgainMsg.position = CGPoint(x: size.width/2, y: -50)
        
        addChild(tryAgainMsg)
        
        let moveLabel = SKAction.moveToY(size.height/2 - 40, duration: 2)
        
        tryAgainMsg.runAction(moveLabel)

        
        runAction(SKAction.playSoundFileNamed("gameover.caf", waitForCompletion: false))
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let gameScene = GameScene(size: size)
        
        view?.presentScene(gameScene, transition: nil)
    }
    
}
