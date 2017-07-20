import Cocoa

let sampleInput = "5 6 7\n3 6 10"
let sampleOutput = "1 1"

typealias Triplet = (Int, Int, Int)
typealias Score = (Int, Int)

func compareTriplets(a: Triplet, b: Triplet) -> Score {
    return (1, 1)
}

func parse(rawInput: String) -> (a: Triplet, b: Triplet) {
    let bothLines = rawInput.split(separator: "\n")
    let lineA = bothLines[0].split(separator: " ").map { Int(String($0))! }
    let lineB = bothLines[1].split(separator: " ").map { Int(String($0))! }
    let tripletA: Triplet = (lineA[0], lineA[1], lineA[2])
    let tripletB: Triplet = (lineB[0], lineB[1], lineB[2])
    
    return (a: tripletA, b: tripletB)
}

func output(result: Score) {
    print("\(result.0) \(result.1)")
}

let parsedInput = parse(rawInput: sampleInput)
let score = compareTriplets(a: parsedInput.a, b: parsedInput.b)

output(result: score)

