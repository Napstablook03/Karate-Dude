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
        sprite.size = CGSize(width: 350, height: 350)
        sprite.position = CGPoint(x: 150, y: -350)
        phys =
            SKPhysicsBody( rectangleOf: CGSize(width: 250, height: 50), center: punchSprite.anchorPoint)
        phys?.affectedByGravity = false
        phys?.isDynamic = false
        phys?.mass = 20
        sprite.physicsBody = phys
    }
    
    
    
    
 
    
}
