//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {

        let line = SKShapeNode(rect: CGRect(x: 10, y: 10, width: 10, height: 600))
        
        line.fillColor = .red
        line.strokeColor = .red
        
        addChild(line)
        
        line.position = CGPoint(x: 10, y: 10)
    }
    
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 600, height: 600))
let scene = GameScene()

scene.scaleMode = .aspectFill
scene.backgroundColor = .white
sceneView.presentScene(scene)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true
