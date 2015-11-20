import SpriteKit
import XCPlayground

let sizeOfCanvas = NSRect(x: 0, y: 0, width: 400, height: 300)
let view = SKView(frame: sizeOfCanvas)
let scene = SKScene(size: CGSize(width: view.frame.height, height: view.frame.height))

XCPShowView("This is a cool type of thing", view)

view.presentScene(scene)


