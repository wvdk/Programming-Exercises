//
//  main.swift
//  ConsoleInteraction
//
//  Created by Wes Van der Klomp on 6/23/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

print("Hello, World!")

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

let sizeOfConsole = getSizeOfConsole()

print(sizeOfConsole)

mainGameLoop()
