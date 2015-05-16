//
//  playScene.swift
//  gametesting
//
//  Created by Anil on 16/05/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class playScene: SKScene {
    
    var cloud01 = SKSpriteNode(imageNamed: "cloud-clipart-png-Cloud-Clip-Art-117")
    var cloud02 = SKSpriteNode(imageNamed: "cloud-clipart-png-Cloud-Clip-Art-117")
    var cloud03 = SKSpriteNode(imageNamed: "cloud-clipart-png-Cloud-Clip-Art-117")
    
    let cloud1Pos = CGPointFromString(NSUserDefaults().objectForKey("cloud1Pos") as! String)
    let cloud2Pos = CGPointFromString(NSUserDefaults().objectForKey("cloud2Pos") as! String)
    let cloud3Pos = CGPointFromString(NSUserDefaults().objectForKey("cloud3Pos") as! String)
   
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    
        let background = SKSpriteNode(imageNamed: "wallpapers-cool-green-desktop-background-wallpaper-papers-games-wallwuzz-hd-wallpaper-15963")
        background.anchorPoint = CGPointMake(0, 1)
        background.position = CGPointMake(0, size.height)
        background.zPosition = -1
        background.size = self.frame.size
        addChild(background)
        
        addScene()
        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(updatePosOfCloud), SKAction.waitForDuration(0.05)])))
    }
    
    func addScene() {
        
        self.cloud01.anchorPoint = CGPointMake(0.5, 0.5)
        self.cloud01.size.width = self.frame.size.width / 3
        self.cloud01.size.height = self.cloud01.size.width / 5
        self.cloud01.position = cloud1Pos
        
        self.cloud02.anchorPoint = CGPointMake(0.5, 0.5)
        self.cloud02.size.width = self.frame.size.width / 3
        self.cloud02.size.height = self.cloud01.size.width / 5
        self.cloud02.position = cloud2Pos
        
        self.cloud03.anchorPoint = CGPointMake(0.5, 0.5)
        self.cloud03.size.width = self.frame.size.width / 3
        self.cloud03.size.height = self.cloud01.size.width / 5
        self.cloud03.position = cloud3Pos
        
        self.addChild(self.cloud01)
        self.addChild(self.cloud02)
        self.addChild(self.cloud03)
    }
    
    func updatePosOfCloud() {
        
        if self.cloud01.position.x < self.cloud01.size.width * -1 {
            self.cloud01.position.x = self.frame.size.width + (self.cloud01.size.width / 2)
        } else {
            self.cloud01.position.x -= 0.5
        }
        
        if self.cloud02.position.x < self.cloud02.size.width * -1 {
            self.cloud02.position.x = self.frame.size.width + (self.cloud02.size.width / 2)
        } else {
            self.cloud02.position.x -= 0.3
        }
        
        if self.cloud03.position.x < self.cloud03.size.width * -1 {
            self.cloud03.position.x = self.frame.size.width + (self.cloud03.size.width / 2)
        } else {
            self.cloud03.position.x -= 0.4
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        

    }
    
}
