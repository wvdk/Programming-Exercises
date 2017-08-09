import Cocoa

let input = ["1", "×", "2", "sin", "3"]

enum Operation {
    case constant(Double)
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
//    case equals
//    case clearAll
}

let operations: Dictionary<String, Operation> = [
    "π": Operation.constant(Double.pi),
    "sin": Operation.unaryOperation(sin),
    "±": Operation.unaryOperation({ -$0}),
    "×": Operation.binaryOperation({ $0 * $1}),
    "+": Operation.binaryOperation({ $0 + $1})
]

func evaluate(input: [String]) -> [String] {
    
    if input.count == 1 {
        return input
    }
    
    var leftSide: Double?
    var rightSide: Double?
    
    for x in input {
        if let number = Double(x) { // It's a number, not an operator
            if leftSide == nil {
                leftSide = number
            } else {
                rightSide = number
            }
        } else if let op = operations[x] {
            
            switch  op {
            case .constant(<#T##Double#>):
                <#code#>
            default:
                <#code#>
            }
            
            
            
            
            if rightSide != nil {
                //            do the operation on left and right char and call self with smaller

                
                
            }
        }
    }
    
    return []
}

evaluate(input: input)
