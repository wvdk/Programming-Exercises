//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var myArray = [0, 0, 0, 0, 0, 0, 0, 12]
var map = [
    [0, 0, 0],
    [0, 0, 12],
    [0, 0, 0,]]

var x = 0
var y = 0

var roomNumber = 12

for i in 0..<myArray.count {
    if myArray[i] == roomNumber {
        x = i
    }
}
x

for r in 0..<map.count {
    for c in 0..<map[r].count {
        if map[r][c] == roomNumber {
            x = c
            y = r
        }
    }
}

