//
//  GameScene.swift
//  RandBW
//
//  Created by Wesley Van der Klomp on 12/29/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // Patern values. Updated by the startPattern___ methods.
    var whiteRectGenerationDelay: TimeInterval? = 1
    var clearScreenDelay: TimeInterval? = 1
    
    lazy var spin = SKAction(named: "Spin")!
    lazy var moveLeft = SKAction(named: "MoveLeft")!
    lazy var moveRight = SKAction(named: "MoveRight")!
    
    /// MARK: - Lifecycle functions
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        self.startPatternOne()
        
//        start({ [weak self] in
//            self?.startPatternTwo()
//
//            start({
//                self?.startPatternOne()
//            }, after: 5)
//
//        }, after: 5)
        
        self.recursivelyTriggerWhiteRectGeneration(after: whiteRectGenerationDelay)
        self.recursivelyTriggerClearScreen(after: clearScreenDelay)
    }
    
    /// Resets the whole scene
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.clearScreen()
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        self.removeAnyOutOfFrameChildren()
    }
    
    func clearScreen() {
        self.removeAllChildren()
    }
    
    // MARK: - Temporal pattern functions
    
    /// Mostly black screen with a lot of short lifespan white rects along center Y.
    func startPatternOne() {
        self.whiteRectGenerationDelay = 0.05
        self.clearScreenDelay = nil
    }

    /// Mostly white screen with a lot of long lifespan white rects spilling out from center Y.
    func startPatternTwo() {
        self.whiteRectGenerationDelay = 0.05
        self.clearScreenDelay = 0.01
    }
    
    func recursivelyTriggerWhiteRectGeneration(after delay: TimeInterval?) {
        guard let delay = delay else { return }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: { [weak self] in
            guard let `self` = self else { return }
            self.generateRandomWhiteRects()
            
            guard let delay = self.whiteRectGenerationDelay else { return }
            self.recursivelyTriggerWhiteRectGeneration(after: delay +||- 0.1)
        })
    }
    
    func recursivelyTriggerClearScreen(after delay: TimeInterval?) {
        guard let delay = delay else { return }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: { [weak self] in
            guard let `self` = self else { return }
            self.clearScreen()
            
            guard let delay = self.clearScreenDelay else { return }
            self.recursivelyTriggerClearScreen(after: delay +||- (random() * 0.3))
        })
    }
    
    /// MARK: - Drawing functions

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

}
