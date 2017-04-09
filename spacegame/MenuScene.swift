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

}
