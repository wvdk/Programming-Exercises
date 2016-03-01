//: Playground - noun: a place where people can play

import Cocoa
import SpriteKit
import XCPlayground

let view = SKView(frame: NSRect(x: 0, y: 0, width: 300, height: 200))
let scene = SKScene(size: CGSize(width: 300, height: 200))

let howManyLines = 10
let spaceBetweenLines = scene.frame.width / CGFloat(howManyLines)

XCPShowView("Lines 2", view)

view.presentScene(scene)


func drawLine(#start: CGPoint, #end: CGPoint) {
    let linePath = CGPathCreateMutable()
    CGPathMoveToPoint(linePath, nil, start.x, start.y)
    CGPathAddLineToPoint(linePath, nil, end.x, end.y)
    
    let moveAlong = SKAction.moveByX(spaceBetweenLines, y: 0, duration: 1)
    let resetPosition = SKAction.moveByX(-spaceBetweenLines, y: 0, duration: 0)
    let seq = SKAction.sequence([moveAlong, resetPosition])
    let moveSidewaysForever = SKAction.repeatActionForever(seq)
    
    let line = SKShapeNode(path: linePath)
    line.runAction(moveSidewaysForever)
    
    scene.addChild(line)
}





for i in 0...howManyLines {
    let start = CGPoint(x: i * Int(spaceBetweenLines), y: 0)
    let end = CGPoint(x: start.x, y: scene.frame.height)
    drawLine(start: start, end: end)
}


drawLine(start: CGPoint(x: 5, y: 5), end: CGPoint(x: 200, y: 100))

XCPExecutionShouldContinueIndefinitely()
