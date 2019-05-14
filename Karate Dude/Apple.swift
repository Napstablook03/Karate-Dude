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

    var appleSprite = SKSpriteNode(imageNamed: "appleSprite")

    var phys : SKPhysicsBody?
    
    init() {
        
        appleSprite.size = CGSize(width: 125, height: 125)
        appleSprite.position = CGPoint(x: 0, y: 1000)
        //appleSprite.zPosition = -5
        phys =
            SKPhysicsBody( rectangleOf: appleSprite.size, center: appleSprite.anchorPoint)
        phys?.affectedByGravity = true
        phys?.mass = 5
        appleSprite.physicsBody = phys
    }

}
