//
//  GameScene.swift
//  spacegame
//
//  Created by Marvin Messenzehl on 31.03.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 0, y: 1472) //hardcoded value for this tutorial is ok!?
        starfield.advanceSimulationTime(10) //because it takes some time scrolling down the black part, skip this time
        self.addChild(starfield)
        
        //background
        starfield.zPosition = -1
    }
    
    
    
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
