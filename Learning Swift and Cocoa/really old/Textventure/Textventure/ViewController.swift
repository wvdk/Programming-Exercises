//
//  ViewController.swift
//  Textventure
//
//  Created by Wes Van der Klomp on 6/14/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

// TODO: Create a transcript object that logs enter game.

import Cocoa

class Location {
    let name: String
    let description: String
    let outlets: [Direction: Location]
    
    init(name: String, description: String, outlets: [Direction: Location]) {
        self.name = name
        self.description = description
        self.outlets = outlets
    }
}

enum Direction {
    case West, North, East, South
}

var frontYard: Location = Location(
    name: "Front Yard",
    description: "You're standing on a well kept lawn in front of an old brick house.",
    outlets: [Direction.East: livingRoom, Direction.West: street])

var street: Location = Location(
    name: "street",
    description: "An empty road leads North and South. To the East is a house.",
    outlets: [Direction.East: frontYard])

var livingRoom: Location = Location(
    name: "Living Room",
    description: "Big, empty living room.",
    outlets: [Direction.West: frontYard])

var currentLocation = frontYard

class ViewController: NSViewController {
    @IBOutlet weak var displayPanel: NSTextField!
    @IBAction func inputTextBox(sender: AnyObject) {
        processInput(sender.stringValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        display("Welcome!\nDo you want to go west or east?")
    }
    
    func move(direction: Direction) {
//        currentLocation.outlets
        
        display(currentLocation.description)
    }

    func processInput(rawText: String) {
        if rawText == "west" {
            move(Direction.West)
        } else if rawText == "north" {
            move(Direction.North)
        } else if rawText == "east" || rawText == "East" || rawText == "e" || rawText == "E" {
            move(Direction.East)
        } else if rawText == "south" {
            move(Direction.South)
        } else if rawText == "clear" {
            display("")
        } else if rawText == "whereami" {
            display(currentLocation.description)
        } else {
            display("Sorry, I don't know what \(rawText) means.")
        }
    }
    
    func display(text: String) {
        displayPanel.stringValue = text
    }
    
}

