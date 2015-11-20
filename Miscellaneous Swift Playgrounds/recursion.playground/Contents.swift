//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


// Lets starts with the Fibonacci sequence.

func fib(n: Int) -> Int {
    if n < 2 {
        return n
    } else {
        return fib(n - 1) + fib(n - 2)
    }
}

for i in 1...10 {
    fib(i)
}