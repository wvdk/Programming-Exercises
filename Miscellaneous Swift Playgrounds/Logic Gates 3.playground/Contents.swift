//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

test(nand(a: false, b: false), shouldReturn: true)
test(nand(a: false, b: true), shouldReturn: true)
test(nand(a: true, b: false), shouldReturn: true)
test(nand(a: true, b: true), shouldReturn: false)

test(not(a: true), shouldReturn: false)
test(not(a: false), shouldReturn: true)

test(and(a: false, b: false), shouldReturn: false)
test(and(a: false, b: true), shouldReturn: false)
test(and(a: true, b: false), shouldReturn: false)
test(and(a: true, b: true), shouldReturn: true)

test(or(a: false, b: false), shouldReturn: false)
test(or(a: false, b: true), shouldReturn: true)
test(or(a: true, b: false), shouldReturn: true)
test(or(a: true, b: true), shouldReturn: true)

test(nor(a: false, b: false), shouldReturn: true)
test(nor(a: false, b: true), shouldReturn: false)
test(nor(a: true, b: false), shouldReturn: false)
test(nor(a: true, b: true), shouldReturn: false)

test(xor(a: false, b: false), shouldReturn: false)
test(xor(a: false, b: true), shouldReturn: true)
test(xor(a: true, b: false), shouldReturn: true)
test(xor(a: true, b: true), shouldReturn: false)

test(xnor(a: false, b: false), shouldReturn: true) // why is this failing?
test(xnor(a: false, b: true), shouldReturn: false)
test(xnor(a: true, b: false), shouldReturn: false)
test(xnor(a: true, b: true), shouldReturn: true) // why is this failing?
