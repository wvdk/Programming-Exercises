//import UIKit
//import PlaygroundSupport
//
/////////////////////////////////////
//
//for x in 0...10 {
//    var y = x * 10
//}
//
//sqrt(2)
//
//
//
//////////////////////////////////////
//
//let mainView = DialView(frame: CGRect(x: 0, y: 0, width: 243, height: 243/2))
//
//mainView.backgroundColor = UIColor.white
//
//PlaygroundPage.current.liveView = mainView
//
//let dialObj = DialView()
//
//
//////////////////////////////////////////
//
//
//let myArray: [Any] = [1, "Array", false]
//
//myArray.first
//




///////////////////////////
// Let's play around with closures.

// I want to understand the pitfalls of referance loops everyone is always talking about.


///////////////////

//var a = UInt32.max
//print(a)
//
//var b = UInt64.max
//print(b)

//let plane = 339.58 / 2
//
//let hotel =  187.58 / 2
//
//let museum = 7.12
//
//let total = plane + hotel + museum



//print("Hello")
//
//func nextLetterInAlphabet(letter: String) -> String? {
//    
//    let alphabet = ["a", "b", "c", "d"]
//
//    
//    if let indexOfA = alphabet.index(of: letter) {
//        return alphabet[indexOfA + 1]
//    }
//    
//    return nil
//    
//}
//
//nextLetterInAlphabet(letter: "b")

////////////////////////////////////////////////////////


let test = "test"




struct TypeWithMethod {
    func thisIsAMethod() {
        print("hi")
    }
}

extension TypeWithMethod {
    func thisIsAMethod2() {
        print("bye")
    }
}

// It appears you cannot override a method with an extension. That makes sense. You can subclass, or use protocols for similar stuff.






