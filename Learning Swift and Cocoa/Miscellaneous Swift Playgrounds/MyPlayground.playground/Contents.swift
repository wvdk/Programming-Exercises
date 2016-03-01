//: Playground - noun: a place where people can play

import Cocoa
import SpriteKit
import XCPlayground

var str = "Hello, playground"

let width = 400
let height = 600
let myView = SKView(frame: NSRect(x: 0, y: 0, width: width, height: height))
let myScene = SKScene(size: CGSize(width: width, height: height))
myView.presentScene(myScene)

XCPShowView("", view: myView)

let box = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 25, height: 25))
box.position = CGPoint(x: 200, y: 200)

myScene.addChild(box)

let myAction = SKAction.rotateByAngle(10.0, duration: 10)

box.runAction(myAction)