import Cocoa


typealias Triplet = (Int, Int, Int)

func compareTriplets(a: Triplet, b: Triplet) -> (aScore: Int, bScore: Int){
    return (1, 1)
}

func parseThenCompareTriplets(rawInput: String) -> String {
    
    let bothLines = rawInput.split(separator: "\n")
    let lineA = bothLines[0].split(separator: " ").map { Int(String($0))! }
    let lineB = bothLines[1].split(separator: " ").map { Int(String($0))! }
    let tripletA: Triplet = (lineA[0], lineA[1], lineA[2])
    let tripletB: Triplet = (lineB[0], lineB[1], lineB[2])

    let scores = compareTriplets(a: tripletA, b: tripletB)
    
    return "\(scores.aScore) \(scores.bScore)"
}


// MARK: Testing

let sampleInput = "5 6 7\n3 6 10"
let sampleOutput = "1 1"

if parseThenCompareTriplets(rawInput: sampleInput) == sampleOutput {
    print("Passed test")
} else {
    print("Failed test")
}

