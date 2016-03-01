//
//  main.swift
//  Moonbase Adventure
//
//  Created by Wes Van der Klomp on 6/28/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

let myMap = Map(layout: [
    [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0],
    [  0,   0,   0,   0,   0,   0,   0,   5,   0,   0],
    [  0,   0,   0,   0,   0,   0,   0,   4,   0,   0],
    [  0,   0,   0,   0,   0,   0,   3,   0,   0,   0],
    [  0,   0,   0,   0,   1,   2,   0,   0,   0,   0],
    [  0,   0,   0,   0,   0,   0,   6,   0,   0,   0],
    [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0],
    [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0],
    [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0],
    [  0,   0,   0,   0,   0,   0,   0,   0,   0,   0]])

var rooms = [
    Room(roomNumber: 0, description: "", items: []),
    Room(roomNumber: 1, description: "You are standing on a path that goes runs East and West. Through the fog, you see a fork in the path a short way Eastward.", items: []),
    Room(roomNumber: 2, description: "You are standing in a three way fork in the road. Go West, Northeast, or Southeast.", items: []),
    Room(roomNumber: 3, description: "You are on a path that runs Northeast and Southwest.", items: []),
    Room(roomNumber: 4, description: "You are standing in front of a small Cabin. You can go down the path (Southwest), or go inside cabin (North).", items: []),
    Room(roomNumber: 5, description: "You are standing in an empty, one room cabin. South to leave.", items: []),
    Room(roomNumber: 6, description: "You hit a dead end of path. Go Northwest to leave.", items: []),
]

var player = Player(startingMap: myMap, startingRoom: 1)

func getInput() -> String {
    let callForInput = NSFileHandle.fileHandleWithStandardInput()
    let str = NSString(data: callForInput.availableData, encoding: NSUTF8StringEncoding)! as String
    
    func removeTrailingNewlineAndMakeLowercase(str: String) -> String {
        var returnStr = str.lowercaseString
        
        if str != "" {
            let indexOfLastChar = str.endIndex.predecessor()
            let lastCharOfStr = str[indexOfLastChar]
            
            if lastCharOfStr == "\n" {
                returnStr = returnStr.substringToIndex(indexOfLastChar)
            }
        }
        
        return returnStr
    }
    
    return removeTrailingNewlineAndMakeLowercase(str)
}

func mainGameLoop() {
    let cmd = getInput()
    
    if cmd == "quit" || cmd == "goodbye" {
        print("Goodbye!")
    } else {
        switch cmd {
        case "help", "h":
            print("I don't know how to help yet.")
        case "west", "w":
            player.move(.w)
        case "northwest", "nw":
            player.move(.nw)
        case "north", "n":
            player.move(.n)
        case "northeast", "ne":
            player.move(.ne)
        case "east", "e":
            player.move(.e)
        case "southeast", "se":
            player.move(.se)
        case "south", "s":
            player.move(.s)
        case "southwest", "sw":
            player.move(.sw)
        case "q", "exit":
            print("You entered 'q'. If you want to quit, please enter 'quit' or 'goodbye'.")
        case "":
            break
        default:
            print("I'm sorry. I don't know what '\(cmd)' means")
        }
        
        mainGameLoop()
    }
}

print("Welcome to Moonbase Adventure. This is a text adventure game. If you've never played a game like this before, here are a few tips:\n\n1) You play text adventure games by typing what you want to do, then hitting 'enter'. In this game, for the sake of simplicity, commands are only one word long. So, for instance, if you wanted to walk towards the west, you'd simply type 'west' then hit enter. \n\n2) A big part of the fun of these games is discovering the commands. So there is no master list. It's a puzzle game after all! But if you really don't know what to do, try entering 'help'.\n\n")

print(rooms[player.currentRoom].description)

mainGameLoop()
