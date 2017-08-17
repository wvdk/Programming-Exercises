import Foundation

enum Expression {
    case number(Double)
    indirect case addition(Expression, Expression)
    indirect case multiplication(Expression, Expression)
    indirect case sin(Expression)
}

private func parse(rawInput: String) -> Expression {
    return Expression.number(100)
}

private func evaluate(_ expression: Expression) -> Double {
    switch expression {
    case .number(let n):
        return n
    case .addition(let leftExpression, let rightExpression):
        return evaluate(leftExpression) + evaluate(rightExpression)
    case .multiplication(let leftExpression, let rightExpression):
        return evaluate(leftExpression) * evaluate(rightExpression)
    case .sin(let e):
        return sin(evaluate(e))
    }
}

func doTheMath(rawTextInput: String) -> Double {
    // call parse
    // call evaluate
    
    return 123.0
}

let a = evaluate(Expression.sin(Expression.number(0.0)))
print(a)
