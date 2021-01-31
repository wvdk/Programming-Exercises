import Foundation

// XOR Trick
// https://florian.github.io/xor-trick/

// Swap values without creating a temp variable:
var a = 10
var b = 20
a ^= b
b ^= a
a ^= b
guard
    a == 20 &&
    b == 10
else {
    fatalError()
}

// Show communativity:
let x = 123
let zero = x ^ x // XORing the same value returns 0.
let notZero = x ^ x ^ x // Not zero because it only cancels out pairs.

// The order doesn't matter!
let ten = x ^ 10 ^ x

// If one of the values is 0 then we always get the other value back.
guard x ^ 0 == x else {
    fatalError()
}
let allCancelledOut = 3 ^ 9 ^ 4 ^ 9 ^ 3 ^ 4 ^ 4 ^ 4

// Get the missing value in an array with the XOR trick
let listA = [1,2,3,4,5,6,7,8,9]
let listB = [1,2,3,4,5,6,7  ,9] // Missing 8!

var xorredA = 0
listA.forEach {
    xorredA = $0 ^ xorredA
}
var xorredB = 0
listB.forEach {
    xorredB = $0 ^ xorredB
}

let missingValue = xorredA ^ xorredB

guard missingValue == 8 else {
    fatalError()
}
