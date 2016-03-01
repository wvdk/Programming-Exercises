//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// https://littlebitesofcocoa.com/22-pattern-matching

// # Ranges

let since: NSTimeInterval = 15 // seconds

switch since {
case (0...10): print("Just now")
case (10...60): print("A minute ago")
default: print("\(since) seconds")
}



// # Enums

enum Result {
    case Sucess
    case Error(String)
}

let r = Result.Error("Testing....")

switch r {
case .Sucess: print("Good!")
case .Error(let err): print("Nope: \(err)")
}

// # Types

class Product { }

class Person {
    let name: String
    init (name: String) {
        self.name = name
    }
}

let something = Person(name: "Joe")
switch something {
case is Product: print("Found a product")
case let person as Person: print("Found a person: \(person.name)")
default: print("Found an unknown thing.")
}

// # Where

let constentOffset = (0, -10.0)

switch constentOffset {
case let (_, y) where y < 0: print("Scrolled up")
case let (_, y) where (0...60) ~= y: print("Scrolling top area")
default: print("Just scrolling")
}

// # Swift 2

let commentCount = 7

if case 1...10 = commentCount {
    print("some comments")
} else if case 11...100 = commentCount {
    print("lots of comments")
}

// Error handling

//enum SendError {
//    case Offline
//    case RateLimited
//}
//
//func send(message: String) {
//    print(message)
//    
//    throw SendError.Offline
//}
//
//do {
//    try send(message: "Hello")
//} catch SendError.Offline {
//    print("User is offline")
//} catch SendError.RateLimited {
//    print("Stop spamming")
////} catch SendError.Blocked
//}



