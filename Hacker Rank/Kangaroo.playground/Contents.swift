//: https://www.hackerrank.com/challenges/kangaroo

import Cocoa

// Types

typealias Kangaroo = (x: Int, v: Int)

// Functions

func doesIntersect(kangarooA: Kangaroo, kangarooB: Kangaroo) -> Bool {
    
    var kangarooACurrentX = kangarooA.x
    var kangarooBCurrentX = kangarooB.x

    var n = 0
    var foundResult = false
    while n <= 10000 && foundResult == false {
        kangarooACurrentX += kangarooA.v
        kangarooBCurrentX += kangarooB.v

        if kangarooACurrentX == kangarooBCurrentX {
            return true
        }
        
        n += 1
    }
    
    return false
}

func parse(input: String) -> (kangarooA: Kangaroo, kangarooB: Kangaroo) {
    let a = input.split(separator: " ").map { Int(String($0))! }
    
    return (kangarooA: (x: a[0], v: a[1]), kangarooB: (x: a[2], v: a[3]))
}

// Tests

let sampleInput0 = "0 3 4 2"
let sampleOutput0 = "YES"

let parsedInput0 = parse(input: sampleInput0)
doesIntersect(kangarooA: parsedInput0.kangarooA, kangarooB: parsedInput0.kangarooB)


let sampleInput1 = "0 2 5 3"
let sampleOutput1 = "NO"

let parsedInput1 = parse(input: sampleInput1)
doesIntersect(kangarooA: parsedInput1.kangarooA, kangarooB: parsedInput1.kangarooB)

