//
//  GameScene.swift
//  RandBW
//
//  Created by Wesley Van der Klomp on 12/29/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let whiteRectGenerationDelay: TimeInterval = 0.05
    let clearScreenDelay: TimeInterval = 0.5
    
    lazy var spin = SKAction(named: "Spin")!
    lazy var moveLeft = SKAction(named: "MoveLeft")!
    lazy var moveRight = SKAction(named: "MoveRight")!
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black

        self.recursivelyTriggerWhiteRectGeneration(after: whiteRectGenerationDelay)
        self.recursivelyTriggerClearScreen(after: clearScreenDelay)
    }
    
    func recursivelyTriggerWhiteRectGeneration(after delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: { [weak self] in
            guard let `self` = self else { return }
            self.generateRandomWhiteRects()
            self.recursivelyTriggerWhiteRectGeneration(after: self.whiteRectGenerationDelay +||- 0.1)
        })
    }
    
    func recursivelyTriggerClearScreen(after delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: { [weak self] in
            guard let `self` = self else { return }
            self.clearScreen()
            self.recursivelyTriggerClearScreen(after: self.clearScreenDelay +||- random())
        })
    }
    
    func clearScreen() {
        self.removeAllChildren()
    }
    
    func getRandomAction() -> SKAction {
        let randomActionList = [moveLeft, moveRight]
        
        return randomActionList.randomItem()
    }
    
    func generateRandomWhiteRects() {
        for i in 0...10 {
            let whiteRect = SKSpriteNode()
            whiteRect.color = .white
            whiteRect.position = CGPoint(x: self.size.width / 2, y: CGFloat(i * 100))
            whiteRect.size = CGSize(width: 20 + Int(arc4random_uniform(UInt32(30))), height: 100)
            
            self.addChild(whiteRect)
            
            whiteRect.run(getRandomAction())
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.clearScreen()
    }

    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        self.removeAnyOutOfFrameChildren()
    }
    
}
