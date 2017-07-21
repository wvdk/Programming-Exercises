//: https://www.hackerrank.com/challenges/kangaroo

import Cocoa

// Types

typealias Kangaroo = (x: Int, v: Int)

// Functions

func doesIntersect(kangarooA: Kangaroo, kangarooB: Kangaroo) -> Bool {
    var kangarooACurrentX = kangarooA.x
    var kangarooBCurrentX = kangarooB.x
    
    for _ in 0...10000 {
        if kangarooACurrentX == kangarooBCurrentX {
            return true
        }
        
        kangarooACurrentX += kangarooA.v
        kangarooBCurrentX += kangarooB.v
    }
    
    return false
}

func doesIntersectAlt(kangarooA: Kangaroo, kangarooB: Kangaroo) -> Bool {
    let xDiff = kangarooA.x - kangarooB.x
    let vDiff = kangarooB.v - kangarooA.v
    let div = xDiff / vDiff
    let remainder = xDiff % vDiff
    
    if remainder == 0 && div >= 0 {
        return true
    } else {
        return false
    }
}

func parse(input: String) -> (kangarooA: Kangaroo, kangarooB: Kangaroo) {
    let a = input.split(separator: " ").map { Int(String($0))! }
    
    return (kangarooA: (x: a[0], v: a[1]), kangarooB: (x: a[2], v: a[3]))
}

func getInputFromStandardIn() -> (kangarooA: Kangaroo, kangarooB: Kangaroo){
    return parse(input: readLine()!)
}

// Tests

let sampleInput0 = "0 3 4 2"
let sampleOutput0 = "YES"

let parsedInput0 = parse(input: sampleInput0)
doesIntersect(kangarooA: parsedInput0.kangarooA, kangarooB: parsedInput0.kangarooB)
doesIntersectAlt(kangarooA: parsedInput0.kangarooA, kangarooB: parsedInput0.kangarooB)


let sampleInput1 = "0 2 5 3"
let sampleOutput1 = "NO"

let parsedInput1 = parse(input: sampleInput1)
doesIntersect(kangarooA: parsedInput1.kangarooA, kangarooB: parsedInput1.kangarooB)
doesIntersectAlt(kangarooA: parsedInput1.kangarooA, kangarooB: parsedInput1.kangarooB)

let sampleInput2 = "9798 2 6667 33"
let sampleOutput2 = "YES"

let parsedInput2 = parse(input: sampleInput2)
doesIntersect(kangarooA: parsedInput2.kangarooA, kangarooB: parsedInput2.kangarooB)
doesIntersectAlt(kangarooA: parsedInput2.kangarooA, kangarooB: parsedInput2.kangarooB)

