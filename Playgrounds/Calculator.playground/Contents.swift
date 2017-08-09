// Calculator

// Brain storming...
//
// One appoach could be:
//
// 1. Parse the array of string elements into an array of operators and doubles
// 2. Parse that into an nested array (AST) of "expresions"*
// 3. Run the AST through a recursive evaluator, returning the final result
//
// *An "expresion" is a simple list. The first item of the list represents the operation, followed by the values to be operated on.

import Cocoa

let exampleInput = ["1", "×", "2", "sin", "3", "+", "π"]

/// In an expression, anything that is not a number (such as "×" or "sin") is an operation. Non-constant operations perform some kind of calculation on some number of inputs, and return the result.
enum Operation {
    case constant(Double)
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
}

let knownOperators: Dictionary<String, Operation> = [
    "π": .constant(Double.pi),
    "sin": .unaryOperation(sin),
    "±": .unaryOperation({ -$0 }),
    "×": .binaryOperation({ $0 * $1 }),
    "+": .binaryOperation({ $0 + $1 })
]

/// A collections of elements of an equation that can be evaluated.
typealias Expression = Array<ExpressionElement>

/// An element of an expression that can be either a number or an operation.
enum ExpressionElement {
    case operation
    case number
}

let opop = knownOperators["π"]

if let op = opop {

    switch op {
    case .constant(let n):
        print(n)
    default:
        print("aaaa")
    }
}


