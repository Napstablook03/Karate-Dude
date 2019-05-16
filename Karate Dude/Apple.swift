//
//  Apple.swift
//  Karate Dude
//
//  Created by Josh Cenina on 5/1/19.
//  Copyright © 2019 Josh Cenina. All rights reserved.
//

import Foundation
import SpriteKit

class Apple {

    var sprite = SKSpriteNode(imageNamed: "appleSprite")
    var appleImage = SKSpriteNode(imageNamed: "appleSprite")
    var gordoImage = SKSpriteNode(imageNamed: "gordoImage")
    var phys : SKPhysicsBody?
    var active = true
    init() {
        
        sprite.size = CGSize(width: 125, height: 125)
        sprite.position = CGPoint(x: 0, y: 1000)
        //appleSprite.zPosition = -5
        phys =
            SKPhysicsBody( rectangleOf: sprite.size, center: sprite.anchorPoint)
        phys?.affectedByGravity = true
        phys?.mass = 2
        phys?.categoryBitMask = 1
        phys?.collisionBitMask = 1
        phys?.contactTestBitMask = 1
        sprite.physicsBody = phys
        
        
    }
   
    
    

}
