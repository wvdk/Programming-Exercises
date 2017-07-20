import Cocoa

typealias Triplet = (Int, Int, Int)

func compareTriplets(a: Triplet, b: Triplet) -> (aScore: Int, bScore: Int){
    return (0, 0)
}

func parseThenCompareTriplets(rawInput: String) -> String {
    return ""
}

let sampleInput = "5 6 7\n3 6 10"
let sampleOutput = "1 1"

if parseThenCompareTriplets(rawInput: sampleInput) == sampleOutput {
    print("Passed test")
} else {
    print("Failed test")
}
