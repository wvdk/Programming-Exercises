// From The Swift Programming Language book, Enums chapter.

import Cocoa

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let two = ArithmeticExpression.number(2)
let sumOfFourAndFive = ArithmeticExpression.addition(four, five) // 4 + 5
let productOfSumOfFourAndFiveTimesTwo = ArithmeticExpression.multiplication(sumOfFourAndFive, two) // (4 + 5) * 2

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let n):
        return n
    case .addition(let leftExpression, let rightExpression):
        return evaluate(leftExpression) + evaluate(rightExpression)
    case .multiplication(let leftExpression, let rightExpression):
        return evaluate(leftExpression) * evaluate(rightExpression)
    }
}

evaluate(productOfSumOfFourAndFiveTimesTwo)
