//
//  main.swift
//  stdinout
//
//  Created by Wes Van der Klomp on 6/22/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

print("Hello, World!")

func getInput() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    return NSString(data: inputData, encoding: NSUTF8StringEncoding)! as String
    // NOTE: Standard input commands entered via terminal include new line character.\n
}

func gameLoop(inputString: String) {
    let inputUpper = inputString.uppercaseString
    if inputUpper == "QUIT\n" {
        print("Goodbye then!")
    } else {
        print("You said: \(inputUpper)")
        gameLoop(getInput())
    }
}

let tputRows = NSTask()
tputRows.launchPath = "/usr/bin/tput"
tputRows.arguments = ["lines"]

//let pipe = NSPipe()
//t.standardOutput = pipe

tputRows.launch()

let tputCols = NSTask()
tputCols.launchPath = "/usr/bin/tput"
tputCols.arguments = ["cols"]
tputCols.launch()


gameLoop(getInput())
