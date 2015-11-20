//
//  main.swift
//  Wesley's Text Adventure
//
//  Created by Wesley Van der Klomp on 11/30/14.
//  Copyright (c) 2014 wvdk. All rights reserved.
//

import Foundation

var parse = Parser()
var input = "asdasda"
var quitCommand = "q"

func getInput() -> String {
    let stdin = NSFileHandle.fileHandleWithStandardInput()
    let inputString = NSString(data: stdin.availableData, encoding: NSUTF16StringEncoding)
    return inputString! as String
}

println("Welcome, my new friend.")

//println("You said: \(parse.getNoun(getInput()))")

//while input != quitCommand {
//    input = getInput()
//    println("You said: \(input)")
//    if input == quitCommand {
//        println("input does = q")
//    } else {
//        println("nope")
//    }
//}

input = getInput()

if input == "q" {
    println("yes, is q")
} else {
    println("nope, not q")
}

println("Farewell, my old friend.")