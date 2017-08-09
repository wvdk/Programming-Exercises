// From The Swift Programming Language book, Enums chapter.

import Cocoa

enum ArithmeticExpression {
    case number(Int)
    case addition
    case multiplication
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
