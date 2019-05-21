//
//  Realground.swift
//  Karate Dude
//
//  Created by Josh Cenina on 5/8/19.
//  Copyright © 2019 Josh Cenina. All rights reserved.
//

import Foundation
import SpriteKit

class Realground {
    var groundSprite = SKSpriteNode(imageNamed: "groundImage")
    var dddHurt = SKSpriteNode(imageNamed: "dddHurt")
    var dddNothurt = SKSpriteNode(imageNamed: "groundImage")
    var phys : SKPhysicsBody?
    var health = 10
    
    init() {
        groundSprite.size = CGSize(width: 650, height: 150)
        groundSprite.position = CGPoint(x: 0, y: -600 )
        groundSprite.zPosition = -4
        
        phys =
            SKPhysicsBody( rectangleOf: CGSize(width: 600, height: 50), center: groundSprite.anchorPoint)
        phys?.affectedByGravity = false
        phys?.isDynamic = false
        phys?.mass = 100
        phys?.categoryBitMask = 1
        phys?.collisionBitMask = 1
        phys?.contactTestBitMask = 1
        groundSprite.physicsBody = phys

    }
}
