import Cocoa
import XCPlayground
import SceneKit

var view = SCNView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
var scene = SCNScene()

view.autoenablesDefaultLighting = true
view.scene = scene

var cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(x: 10, y: 10, z: 30)

scene.rootNode.addChildNode(cameraNode)

var box = SCNNode(geometry: SCNBox(width: 10, height: 15, length: 10, chamferRadius: 0))
var color = NSColor.redColor()

box.geometry?.firstMaterial?.diffuse.contents = color

scene.rootNode.addChildNode(box)

XCPShowView("Space", view: view)



