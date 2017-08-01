//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {

    }
    
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 400, height: 400))
let scene = GameScene()

scene.scaleMode = .aspectFill
sceneView.presentScene(scene)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true
