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
    var phys : SKPhysicsBody?
    
    init() {
        groundSprite.size = CGSize(width: 650, height: 150)
        groundSprite.position = CGPoint(x: 0, y: -600 )
        groundSprite.zPosition = -4
    }
}
