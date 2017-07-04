/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import SpriteKit

class GameScene: SKScene {
  
  struct PhysicsCategory {
    static let Player: UInt32 = 1
    static let Obstacle: UInt32 = 2
    static let Edge: UInt32 = 4
  }
  
  let colors = [SKColor.yellow, SKColor.red, SKColor.blue, SKColor.purple]
  let player = SKShapeNode(circleOfRadius: 40)
  var obstacles: [SKNode] = []
  let obstacleSpacing: CGFloat = 800
  let cameraNode = SKCameraNode()
  let scoreLabel = SKLabelNode()
  var score = 0
  
  override func didMove(to view: SKView) {
    setupPlayerAndObstacles()
    
    let playerBody = SKPhysicsBody(circleOfRadius: 30)
    playerBody.mass = 1.5
    playerBody.categoryBitMask = PhysicsCategory.Player
    playerBody.collisionBitMask = 4
    player.physicsBody = playerBody
    
    let ledge = SKNode()
    ledge.position = CGPoint(x: size.width/2, y: 160)
    let ledgeBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 10))
    ledgeBody.isDynamic = false
    ledgeBody.categoryBitMask = PhysicsCategory.Edge
    ledge.physicsBody = ledgeBody
    addChild(ledge)
    
    physicsWorld.gravity.dy = -22
    physicsWorld.contactDelegate = self
    
    addChild(cameraNode)
    camera = cameraNode
    cameraNode.position = CGPoint(x: size.width/2, y: size.height/2)
    
    scoreLabel.position = CGPoint(x: -350, y: -900)
    scoreLabel.fontColor = .white
    scoreLabel.fontSize = 150
    scoreLabel.text = String(score)
    cameraNode.addChild(scoreLabel)
  }
  
  func setupPlayerAndObstacles() {
    addPlayer()
    addObstacle()
    addObstacle()
    addObstacle()
  }
  
  func addPlayer() {
    player.fillColor = .blue
    player.strokeColor = player.fillColor
    player.position = CGPoint(x: size.width/2, y: 200)
    
    addChild(player)
  }
  
  func addObstacle() {
    let choice = Int(arc4random_uniform(2))
    switch choice {
    case 0:
      addCircleObstacle()
    case 1:
      addSquareObstacle()
    default:
      print("something went wrong")
    }
  }
  
  func addCircleObstacle() {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: -200))
    path.addLine(to: CGPoint(x: 0, y: -160))
    path.addArc(withCenter: CGPoint.zero,
                radius: 160,
                startAngle: CGFloat(3.0 * M_PI_2),
                endAngle: CGFloat(0),
                clockwise: true)
    path.addLine(to: CGPoint(x: 200, y: 0))
    path.addArc(withCenter: CGPoint.zero,
                radius: 200,
                startAngle: CGFloat(0.0),
                endAngle: CGFloat(3.0 * M_PI_2),
                clockwise: false)
    
    let obstacle = obstacleByDuplicatingPath(path, clockwise: true)
    obstacles.append(obstacle)
    obstacle.position = CGPoint(x: size.width/2, y: obstacleSpacing * CGFloat(obstacles.count))
    addChild(obstacle)
    
    let rotateAction = SKAction.rotate(byAngle: 2.0 * CGFloat(M_PI), duration: 8.0)
    obstacle.run(SKAction.repeatForever(rotateAction))
  }
  
  func addSquareObstacle() {
    let path = UIBezierPath(roundedRect: CGRect.init(x: -200, y: -200,
                                                     width: 400, height: 40),
                            cornerRadius: 20)
    
    let obstacle = obstacleByDuplicatingPath(path, clockwise: false)
    obstacles.append(obstacle)
    obstacle.position = CGPoint(x: size.width/2, y: obstacleSpacing * CGFloat(obstacles.count))
    addChild(obstacle)
    
    let rotateAction = SKAction.rotate(byAngle: -2.0 * CGFloat(M_PI), duration: 7.0)
    obstacle.run(SKAction.repeatForever(rotateAction))
  }
  
  func obstacleByDuplicatingPath(_ path: UIBezierPath, clockwise: Bool) -> SKNode {
    let container = SKNode()
    
    var rotationFactor = CGFloat(M_PI_2)
    if !clockwise {
      rotationFactor *= -1
    }
    
    for i in 0...3 {
      let section = SKShapeNode(path: path.cgPath)
      section.fillColor = colors[i]
      section.strokeColor = colors[i]
      section.zRotation = rotationFactor * CGFloat(i);
      
      let sectionBody = SKPhysicsBody(polygonFrom: path.cgPath)
      sectionBody.categoryBitMask = PhysicsCategory.Obstacle
      sectionBody.collisionBitMask = 0
      sectionBody.contactTestBitMask = PhysicsCategory.Player
      sectionBody.affectedByGravity = false
      section.physicsBody = sectionBody
      
      container.addChild(section)
    }
    return container
  }
  
  func dieAndRestart() {
    print("boom")
    player.physicsBody?.velocity.dy = 0
    player.removeFromParent()
    
    for node in obstacles {
      node.removeFromParent()
    }
    
    obstacles.removeAll()
    
    setupPlayerAndObstacles()
    cameraNode.position = CGPoint(x: size.width/2, y: size.height/2)
    score = 0
    scoreLabel.text = String(score)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    player.physicsBody?.velocity.dy = 800.0
  }
  
  override func update(_ currentTime: TimeInterval) {
    
    if player.position.y > obstacleSpacing * CGFloat(obstacles.count - 2) {
      print("score")
      score += 1
      scoreLabel.text = String(score)
      addObstacle()
    }
    
    let playerPositionInCamera = cameraNode.convert(player.position, from: self)
    if playerPositionInCamera.y > 0 {
      cameraNode.position.y = player.position.y
    }
    
    if playerPositionInCamera.y < -size.height/2 {
      dieAndRestart()
    }
  }
  
}

extension GameScene: SKPhysicsContactDelegate {
  
  func didBegin(_ contact: SKPhysicsContact) {
    
    if let nodeA = contact.bodyA.node as? SKShapeNode, let nodeB = contact.bodyB.node as? SKShapeNode {
      if nodeA.fillColor != nodeB.fillColor {
        dieAndRestart()
      }
    }
  }
}
