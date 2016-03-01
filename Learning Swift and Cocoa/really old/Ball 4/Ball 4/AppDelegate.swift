//
//  AppDelegate.swift
//  Ball 4
//
//  Created by Wes Van der Klomp on 5/7/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//


import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {

        let scene = GameScene()
        scene.size = window.frame.size
        scene.scaleMode = .AspectFill
        scene.backgroundColor = SKColor.grayColor()
        
        skView!.presentScene(scene)
        skView!.ignoresSiblingOrder = true

//        skView!.showsFPS = true
//        skView!.showsNodeCount = true
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
}
