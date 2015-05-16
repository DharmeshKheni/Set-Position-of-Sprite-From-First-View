//
//  GameScene.swift
//  gametesting
//
//  Created by Anil on 16/05/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var button: SKNode! = nil
    var playButton = SKSpriteNode(imageNamed: "next-page-button")
    var cloud01 = SKSpriteNode(imageNamed: "cloud-clipart-png-Cloud-Clip-Art-117")
    var cloud02 = SKSpriteNode(imageNamed: "cloud-clipart-png-Cloud-Clip-Art-117")
    var cloud03 = SKSpriteNode(imageNamed: "cloud-clipart-png-Cloud-Clip-Art-117")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let background = SKSpriteNode(imageNamed: "wallpapers-cool-green-desktop-background-wallpaper-papers-games-wallwuzz-hd-wallpaper-15963")
        background.anchorPoint = CGPointMake(0, 1)
        background.position = CGPointMake(0, size.height)
        background.zPosition = -1
        background.size = self.frame.size
        addChild(background)
        
        self.playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(self.playButton)

        
        addScene()
        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(updatePosOfCloud), SKAction.waitForDuration(0.05)])))
        
    }
    
    func addScene() {
        
        self.cloud01.anchorPoint = CGPointMake(0.5, 0.5)
        self.cloud01.size.width = self.frame.size.width / 3
        self.cloud01.size.height = self.cloud01.size.width / 5
        self.cloud01.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame) - 50)
        
        self.cloud02.anchorPoint = CGPointMake(0.5, 0.5)
        self.cloud02.size.width = self.frame.size.width / 3
        self.cloud02.size.height = self.cloud01.size.width / 5
        self.cloud02.position = CGPointMake(CGRectGetMaxX(self.frame) - 50, CGRectGetMaxY(self.frame) - 200)
        
        self.cloud03.anchorPoint = CGPointMake(0.5, 0.5)
        self.cloud03.size.width = self.frame.size.width / 3
        self.cloud03.size.height = self.cloud01.size.width / 5
        self.cloud03.position = CGPointMake(CGRectGetMinX(self.frame) + 50, CGRectGetMaxY(self.frame) - 125)
        
        self.addChild(self.cloud01)
        self.addChild(self.cloud02)
        self.addChild(self.cloud03)
    }

    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            if self.nodeAtPoint(location) == self.playButton {
                
                let cloud1Pos = cloud01.position
                let cloud2Pos = cloud02.position
                let cloud3Pos = cloud03.position
                
                NSUserDefaults().setObject(NSStringFromCGPoint(cloud1Pos), forKey: "cloud1Pos")
                NSUserDefaults().setObject(NSStringFromCGPoint(cloud2Pos), forKey: "cloud2Pos")
                NSUserDefaults().setObject(NSStringFromCGPoint(cloud3Pos), forKey: "cloud3Pos")
                
                let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let letsPlay = playScene(size: self.size)
                self.view?.presentScene(letsPlay, transition: reveal)
            }
        }
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
