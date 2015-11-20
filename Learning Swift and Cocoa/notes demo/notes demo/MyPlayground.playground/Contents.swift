//: Playground - noun: a place where people can play

import UIKit
//import Note

var str = "Hello, playground"

struct Note {
    var content: String
    var title: String {
        get {
            let a = content.componentsSeparatedByString("\n")
            return a[0]
        }
    }
}


let myNote = Note(content: "This is a test\nLine2\nline three")

myNote.title
myNote.content





