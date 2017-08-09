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
let sumOfFourAndFive = ArithmeticExpression.addition(four, five)
let productOfSumOfFourAndFiveTimesTwo = ArithmeticExpression.multiplication(sumOfFourAndFive, two)

