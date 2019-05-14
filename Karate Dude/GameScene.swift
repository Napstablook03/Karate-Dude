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
    var counter = 0
    var phys: SKPhysicsBody?
    
    override func didMove(to view: SKView) {
        
        self.addChild(floor.floorSprite)
        self.addChild(knucklejoe.sprite)
        self.addChild(apple.appleSprite)
        self.addChild(ground.groundSprite)
    }
     
    
    
    func touchDown(atPoint pos : CGPoint) {
        timer = 5
        
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
    
    var nextSpawnTime : Double = -1
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if currentTime > nextSpawnTime {
            print("new apple")
            apple.appleSprite.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            apple.appleSprite.position = CGPoint(x: 0, y: 1000)
            
            nextSpawnTime = currentTime.advanced(by: Double.random(in: 3 ... 5))
        }
        if timer > 0{
            
            if knucklejoe.sprite.texture != punchTex {
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
