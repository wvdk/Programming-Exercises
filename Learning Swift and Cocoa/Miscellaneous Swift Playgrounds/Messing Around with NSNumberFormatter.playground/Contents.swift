//: Playground - noun: a place where people can play

import Cocoa

let n1 = NSNumber(int: 1234)
let n2 = NSNumber(float: 1.5)
let n3 = NSNumber(bool: false)
let n4 = NSNumber(double: 999.9990)

//let formatter = NSNumberFormatter()

//formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
//formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
//formatter.numberStyle = NSNumberFormatterStyle.PercentStyle
//formatter.numberStyle = NSNumberFormatterStyle.ScientificStyle

//let stringN1 = formatter.stringFromNumber(n1)
//let stringN2 = formatter.stringFromNumber(n2)
//let stringN3 = formatter.stringFromNumber(n3)
//let stringN4 = formatter.stringFromNumber(n4)

//func stringFromNumber(num: NSNumber) -> NSString {
//    return ""
//}

let originalNumber = NSNumber(int: 10000)
//let stringNumber = stringFromNumber(originalNumber)

let myFormatter = NSNumberFormatter()
myFormatter.multiplier = 0.001
myFormatter.positiveFormat = "#,###k"
myFormatter.zeroSymbol = "0"

let myStringNumber = myFormatter.stringFromNumber(n4)

