//
//  Karatedude.swift
//  Karate Dude
//
//  Created by Josh Cenina on 4/11/19.
//  Copyright © 2019 Josh Cenina. All rights reserved.
//

import Foundation
import SpriteKit
class Knucklejoe {
    var sprite = SKSpriteNode(imageNamed: "knucklejoeImage")
    var phys: SKPhysicsBody?
    var punchSprite = SKSpriteNode(imageNamed: "punch")
    
    
    init() {
        sprite.size = CGSize(width: 700, height: 700)
        sprite.position = CGPoint(x: 125, y: -350)
        phys =
            SKPhysicsBody( rectangleOf: punchSprite.size, center: punchSprite.anchorPoint)
        
        phys?.mass = 10
        punchSprite.physicsBody = phys
    }
    
    
    
    
    func swapSprite(){
        sprite.texture = SKTexture(imageNamed: "punch")
        sprite.texture = SKTexture(imageNamed: "knuckelejoeImage")
    }
    
}
