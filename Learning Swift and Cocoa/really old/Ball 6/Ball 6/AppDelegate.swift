//
//  AppDelegate.swift
//  Ball 6
//
//  Created by Wes Van der Klomp on 5/10/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//


import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        /* Pick a size for the scene */
        
        let scene = FirstScene()
        scene.size = window.frame.size
        scene.scaleMode = .AspectFill

        self.skView!.presentScene(scene)

//        self.skView!.showsFPS = true
        self.skView!.showsNodeCount = true
    }
}
