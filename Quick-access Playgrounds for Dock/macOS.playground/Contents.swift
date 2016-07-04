//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground

var str = "Hello, playground"

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

for i in 0...10 {
    NSBeep()
    
    print(i)
}

