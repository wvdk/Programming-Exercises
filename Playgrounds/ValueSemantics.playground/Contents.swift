//: Playground - noun: a place where people can play

import Cocoa

struct LittleStruct {
    let constantNumber = 0
    var variableNumber = 0
}

let littleStruct1 = LittleStruct()
let littleStruct2 = LittleStruct(variableNumber: 2)

var littleArray = [littleStruct1, littleStruct2]

print(littleArray)

for i in 0..<littleArray.count {
    var currentLittleStruct = littleArray[i]
    
    currentLittleStruct.variableNumber = 123
    
//    littleArray[i] = currentLittleStruct
}

print(littleArray)
