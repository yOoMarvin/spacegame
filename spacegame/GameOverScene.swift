//
//  GameOverScene.swift
//  spacegame
//
//  Created by Marvin Messenzehl on 13.04.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene {
    
    var score: Int = 0
    
    var scoreLabel: SKLabelNode!
    var newGameButtonNode: SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        scoreLabel.text = "\(score)"
        
        newGameButtonNode = self.childNode(withName: "newGameButton") as! SKSpriteNode
        newGameButtonNode.texture = SKTexture(imageNamed: "newGameButton")
    }
    
    

}
