import UIKit
import SceneKit
import SpriteKit

let mainView = SCNView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
let mainScene = SCNScene()

mainView.scene = mainScene

let ball = SCNSphere()
let node = SCNNode(geometry: ball)

mainView.scene?.rootNode.addChildNode(node)
mainView.backgroundColor = UIColor.redColor()

mainScene

mainView


let spriteView = SKView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
let spriteScene = SKScene()

spriteView.presentScene(spriteScene)

let circle = SKShapeNode(circleOfRadius: 50.0)



spriteView.scene?.addChild(circle)
spriteView.backgroundColor = UIColor.redColor()

spriteScene




