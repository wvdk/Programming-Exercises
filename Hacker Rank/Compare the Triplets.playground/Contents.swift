//: # Compare the Triplets
//:
//: [From HackerRank](https://www.hackerrank.com/challenges/compare-the-triplets)
//:
//: ![problem](problem.png)


import Cocoa

//: ### Types

typealias Triplet = (Int, Int, Int)
typealias Score = (Int, Int)

//: ### Functions

func compareTriplets(a: Triplet, b: Triplet) -> Score {
    var aScore = 0, bScore = 0
    
    if a.0 > b.0   {
        aScore += 1
    } else if a.0 < b.0 {
        bScore += 1
    }
    
    if  a.1 > b.1  {
        aScore += 1
    } else if a.1 < b.1 {
        bScore += 1
    }
    
    if a.2 > b.2  {
        aScore += 1
    } else if a.2 < b.2 {
        bScore += 1
    }
    
    return (aScore, bScore)
}

func parse(rawInput: String) -> (a: Triplet, b: Triplet) {
    let bothLines = rawInput.split(separator: "\n")
    let lineA = bothLines[0].split(separator: " ").map { Int(String($0))! }
    let lineB = bothLines[1].split(separator: " ").map { Int(String($0))! }
    let tripletA: Triplet = (lineA[0], lineA[1], lineA[2])
    let tripletB: Triplet = (lineB[0], lineB[1], lineB[2])
    
    return (a: tripletA, b: tripletB)
}

func output(result: Score) -> String {
    return "\(result.0) \(result.1)"
}

//: ### Tests

let sampleInput = "5 6 7\n3 6 10"
let sampleOutput = "1 1"

let parsedInput = parse(rawInput: sampleInput)
let score = compareTriplets(a: parsedInput.a, b: parsedInput.b)

output(result: score) == sampleOutput
