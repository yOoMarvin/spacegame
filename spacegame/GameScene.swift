//
//  GameScene.swift
//  spacegame
//
//  Created by Marvin Messenzehl on 31.03.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //player properties
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    
    //score properties
    var scoreLabel: SKLabelNode!
    var score: Int = 0 {
        didSet{
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    //timer properties
    var gameTimer: Timer!
    
    
    override func didMove(to view: SKView) {
        
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 0, y: 1472) //hardcoded value for this tutorial is ok!?
        starfield.advanceSimulationTime(10) //because it takes some time scrolling down the black part, skip this time
        self.addChild(starfield)
        
        //background
        starfield.zPosition = -1
        
        
        player = SKSpriteNode(imageNamed: "shuttle")
        //no phsysics body for player, for easier use
        
        // position near center
        player.position = CGPoint(x: self.frame.size.width / 2, y: player.size.height / 2 + 20)
        
        self.addChild(player)
        
        //physiscs
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        
        //score label
        scoreLabel = SKLabelNode(text: "Score: 0")
        scoreLabel.position = CGPoint(x: 100, y: self.frame.height - 60)
        scoreLabel.fontName = "AvenirNext-Heavy"
        scoreLabel.fontSize = 36
        scoreLabel.fontColor = UIColor.white
        score = 0
        
        self.addChild(scoreLabel)
        
        
        //timer for enemy spawn
        gameTimer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
        
    }
    
    
    
    
    
    func addAlien() {
        
        
    }
    
    
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
