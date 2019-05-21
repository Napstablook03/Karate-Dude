//
//  GameScene.swift
//  Karate Dude
//
//  Created by Josh Cenina on 4/11/19.
//  Copyright © 2019 Josh Cenina. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var floor = Floor()
    var apple = Apple()
    var knucklejoe = Knucklejoe()
    var ground = Realground()
    let punchTex = SKTexture(imageNamed: "punch")
    var timer = 20
    var health = 10
    var pointsLabel = SKLabelNode(text: "0")
    var healthLabel = SKLabelNode(text: "5")
    var points = 0
    let hurtTex = SKTexture(imageNamed: "dddHurt")
    var game : GameViewController?
    var phys: SKPhysicsBody?
    var dropSpeed = 0
    
    override func didMove(to view: SKView) {
        
        self.addChild(floor.floorSprite)
        self.addChild(knucklejoe.sprite)
        self.addChild(apple.sprite)
        self.addChild(ground.groundSprite)
        self.addChild(pointsLabel)
        self.addChild(healthLabel)
        pointsLabel.position = CGPoint(x: -100, y: 500 )
        pointsLabel.zPosition = 3
        pointsLabel.fontColor = UIColor.red
        pointsLabel.fontSize = CGFloat(100)
        healthLabel.position = CGPoint(x: -200, y: 450)
        healthLabel.zPosition = 3
        healthLabel.fontColor = UIColor.blue
        healthLabel.fontSize = CGFloat(50)
    }
     
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        if timer < -19 {
        timer = 10
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    func swapObjects(){
        if Int.random(in: 0 ... 10) > 7  {
            apple.sprite.texture = apple.gordoImage.texture
        } else  if Int.random(in: 0 ... 10) < 6 {
            apple.sprite.texture = apple.appleImage.texture
        } else if Int.random(in: 0 ... 10) == 1 {
            apple.sprite.texture = apple.coolSprite.texture
        }
        apple.active = true
        dropSpeed -= 50
    }
    func hurtDDD(){
       if apple.sprite.texture == apple.gordoImage.texture && apple.active && ground.phys!.allContactedBodies().contains(apple.phys!) {
        ground.groundSprite.texture = ground.dddHurt.texture
       } else {
        ground.groundSprite.texture = ground.dddNothurt.texture
        
        }
    }
    
    
    
    var nextSpawnTime : Double = -1
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if currentTime > nextSpawnTime {
            //print("new apple")
            //apple.sprite.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            apple.sprite.position = CGPoint(x: 0, y: 1000)
            apple.sprite.physicsBody?.velocity = CGVector(dx: 0, dy: dropSpeed)
            swapObjects()
            
            nextSpawnTime = currentTime.advanced(by: Double.random(in: 2 ... 3))
        }
        //if apple touches the ground
        if  apple.sprite.texture == apple.appleImage.texture && apple.active && ground.phys!.allContactedBodies().contains(apple.phys!){
            health -= 1
            points -= 2
            hurtDDD()
            apple.active = false
            
            
        }
        //if knuckle joe touches apple
        if knucklejoe.phys!.allContactedBodies().contains(apple.phys!){
            points += 3
            apple.active = false
            print(points)
        }
        //if gordo touches Dedede
        if apple.sprite.texture == apple.gordoImage.texture && apple.active && ground.phys!.allContactedBodies().contains(apple.phys!) {
            points += 3
            
            hurtDDD()
            
            apple.active = false
            
            print(points)
        }
        //if knuckle joe touches gordo
        if apple.sprite.texture == apple.gordoImage.texture && knucklejoe.phys!.allContactedBodies().contains(apple.phys!){
            points -= 5
            health -= 2
            apple.active = false
            print(points)
        }
        //if knuckle joe touches coolSprite
        if apple.sprite.texture == apple.coolSprite.texture && knucklejoe.phys!.allContactedBodies().contains(apple.phys!){
                points += 20
                health += 2
                apple.active = false
                print(points)
        }
        
        //game over
        if health <= 0 {
            game!.gameOver()
            health = 10
            points = 0
            dropSpeed = 0
            
        }
        pointsLabel.text = String("Score: ") + String(points)
        healthLabel.text = String("Health:") + String(health)
        
        if timer > -20 {
            
            //if knucklejoe.sprite.texture != punchTex {
            if timer > 1 {
                knucklejoe.sprite.texture = punchTex
                knucklejoe.phys?.categoryBitMask = 1
                knucklejoe.phys?.collisionBitMask = 1
                knucklejoe.phys?.contactTestBitMask = 1
            }
            if timer == 1 {
                knucklejoe.sprite.texture = SKTexture(imageNamed: "knucklejoeImage")
                knucklejoe.phys?.categoryBitMask = 2
                knucklejoe.phys?.collisionBitMask = 2
                knucklejoe.phys?.contactTestBitMask = 2
            }
            timer -= 1
            
        }
    }
}
