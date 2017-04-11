//
//  MenuScene.swift
//  spacegame
//
//  Created by Marvin Messenzehl on 09.04.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    //MARK: Properties
    var starfield: SKEmitterNode!
    
    var newGameButtonNode: SKSpriteNode!
    var difficultyButtonNode: SKSpriteNode!
    var difficultyLabelNode: SKLabelNode!
    
    
    
    override func didMove(to view: SKView) {
        
        starfield = self.childNode(withName: "starfield") as! SKEmitterNode
        starfield.advanceSimulationTime(10)
        
        newGameButtonNode = self.childNode(withName: "newGameButton") as! SKSpriteNode
        difficultyButtonNode = self.childNode(withName: "difficultyButton") as! SKSpriteNode
                
        difficultyLabelNode = self.childNode(withName: "difficultyLabel") as!SKLabelNode
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first //touch object
        
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "newGameButton" {
                //transition to game scene
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameScene = GameScene(size: self.size)
                self.view?.presentScene(gameScene, transition: transition)
                
            } else if nodesArray.first?.name == "difficultyButton" {
                changeDifficulty()
            }
        }
    }
    
    func changeDifficulty() {
        
        let userDefaults = UserDefaults.standard
        
        if difficultyLabelNode.text == "Easy" {
            difficultyLabelNode.text = "Hard"
            userDefaults.set(true, forKey: "hard")
        } else {
            difficultyLabelNode.text = "Easy"
            userDefaults.set(false, forKey: "hard")
        }
        
        userDefaults.synchronize()
        
    }

}
