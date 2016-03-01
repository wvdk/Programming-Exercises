//
//  main.swift
//  textventure11
//
//  Created by Wes Van der Klomp on 6/26/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

func getInput() -> String {
    let callForInput = NSFileHandle.fileHandleWithStandardInput()
    let str = NSString(data: callForInput.availableData, encoding: NSUTF8StringEncoding)! as String
    return str
}

func mainGameLoop() {
    let rawInputString = getInput().lowercaseString
    let command = removeTrailingNewlineAndMakeLowercase(rawInputString)
    
    print("you said: \(command)")
    
    if command == "q" || command == "quit" {
        print("Goodbye!")
    } else {
        mainGameLoop()
    }
}

// First, lets get the size of the console.
if let numberOfRowsOfConsole = getNumberOfRowsOfConsole() {
    if let numberOfColumnsOfConsole = getNumberOfColumnsOfConsole() {
        
        // Fill the console with background
        let bg = Rect(position: Point(x: 0, y: 0), size: Size(width: numberOfColumnsOfConsole, height: numberOfRowsOfConsole - 1), fillChar: "*")

        print(bg.draw())
        
        print("cols: \(numberOfColumnsOfConsole)")
        
        mainGameLoop()
    }
} else {
    print("Could not get size of console using 'tput'")
}

