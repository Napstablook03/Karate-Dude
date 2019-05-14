//
//  Floor.swift
//  Karate Dude
//
//  Created by Josh Cenina on 5/1/19.
//  Copyright © 2019 Josh Cenina. All rights reserved.
//

import Foundation
import SpriteKit

class Floor {
    var floorSprite = SKSpriteNode(imageNamed: "Floor")
    
    
    init() {
        
        floorSprite.size = CGSize(width: 650, height: 1500)
        floorSprite.position = CGPoint(x: 0, y: -110)
        floorSprite.zPosition =  -7
        
        
    }
}
