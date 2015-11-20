//
//  AppDelegate.swift
//  Textventure 3
//
//  Created by Wes Van der Klomp on 6/16/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var player: Player!
    var Locations: [Location]!
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var displayPanel: NSTextField!
    
    @IBAction func inputField(sender: NSTextField) {
        processInput(sender.stringValue)
    }
    
    func display(text: String) {
        displayPanel.stringValue = text
    }
    
    func move(direction: Direction) {

    }
    
    func processInput(input: String) {
        display(">>> \(input)")
        
        let lowInput = input.lowercaseString
        
        if lowInput == "w" || lowInput == "west" {
            move(Direction.West)
        }
//      else if input.lowercaseString == "n" || input.lowercaseString == "north" {
//            
//        } else if input.lowercaseString == "e" || input.lowercaseString == "east" {
//            
//        } else if input.lowercaseString == "s" || input.lowercaseString == "south" {
//            
//        } else {
//            display("I'm sorry, I don't know what that means.\nEnter\"help\" for a list of things I do understand.")
//        }
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        display("Welcome!")
        

        
//        player = Player(currentLocation: livingRoom)
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
}

