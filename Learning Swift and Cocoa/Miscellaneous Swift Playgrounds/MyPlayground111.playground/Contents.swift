//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func removeTrailingNewlineAndMakeLowercase(str: String) -> String {
    let indexOfLastChar = str.endIndex.predecessor()
    let lastCharOfStr = str[indexOfLastChar]
    
    var returnStr = str.lowercaseString
    
    if lastCharOfStr == "\n" {
        returnStr = returnStr.substringToIndex(indexOfLastChar)
    }
    
    return returnStr
}

removeTrailingNewlineAndMakeLowercase("this is a test")
removeTrailingNewlineAndMakeLowercase("this is a TEST")
removeTrailingNewlineAndMakeLowercase("this is a test\n")