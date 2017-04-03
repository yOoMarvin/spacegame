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
    
    //aliens
    var possibleAliens = ["alien", "alien2", "alien3"]
    
    //bitmasks for aliens and torpedo
    let alienCategory: UInt32 = 0x1 << 1
    let photonTorpedoCategory: UInt32 = 0x1 << 0
    
    
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
        
        //shuffle the alien array to display everytime a random alien
        possibleAliens = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleAliens) as! [String]
        
        let alien = SKSpriteNode(imageNamed: possibleAliens[0])
        
        let randomAlienPosition = GKRandomDistribution(lowestValue: 0, highestValue: 414)
        let position = CGFloat(randomAlienPosition.nextInt())
        
        alien.position = CGPoint(x: position, y: self.frame.size.height + alien.size.height)
        
        alien.physicsBody = SKPhysicsBody(rectangleOf: alien.size)
        alien.physicsBody?.isDynamic = true
        
        alien.physicsBody?.categoryBitMask = alienCategory
        alien.physicsBody?.contactTestBitMask = photonTorpedoCategory
        alien.physicsBody?.collisionBitMask = 0
        
        self.addChild(alien)
        
        let animationDuration: TimeInterval = 6
        
        var actionArray = [SKAction]()
        
        actionArray.append(SKAction.move(to: CGPoint(x: position, y: -alien.size.height), duration: animationDuration))
        actionArray.append(SKAction.removeFromParent())
        
        alien.run(SKAction.sequence(actionArray))
        
        
        
    }
    
    
    func fireTorpedo() {
        
        //first play the torpedo sound
        self.run(SKAction.playSoundFileNamed("torpedo.mp3", waitForCompletion: false))
        
        let torpedoNode = SKSpriteNode(imageNamed: "torpedo")
        torpedoNode.position = player.position
        torpedoNode.position.y += 5 //move slightly up
        
        torpedoNode.physicsBody = SKPhysicsBody(circleOfRadius: torpedoNode.size.width / 2)
        torpedoNode.physicsBody?.isDynamic = true
        
        torpedoNode.physicsBody?.categoryBitMask = photonTorpedoCategory
        torpedoNode.physicsBody?.contactTestBitMask = alienCategory
        torpedoNode.physicsBody?.collisionBitMask = 0
        torpedoNode.physicsBody?.usesPreciseCollisionDetection = true
        
        self.addChild(torpedoNode)
    }
    
    
    
    
    
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
