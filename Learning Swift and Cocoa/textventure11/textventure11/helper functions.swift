//
//  helperFunctions.swift
//  ConsoleInteraction
//
//  Created by Wes Van der Klomp on 6/24/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

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

func sh(args: String...) -> String {
    let task = NSTask()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    
    let pipe = NSPipe()
    task.standardOutput = pipe
    task.standardError = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = NSString(data: data, encoding: NSUTF8StringEncoding)! as String
    
    return output
}

func getNumberOfColumnsOfConsole() -> Int? {
    var columns: Int?
    
    let tputCols = removeTrailingNewlineAndMakeLowercase(sh("tput", "cols"))

    if let c = Int(tputCols) {
        columns = c
    }
    
    return columns
}

func getNumberOfRowsOfConsole() -> Int? {
    var rows: Int?
    
    let tputLines = removeTrailingNewlineAndMakeLowercase(sh("tput", "lines"))
    
    if let r = Int(tputLines) {
        rows = r
    }
    
    return rows
}