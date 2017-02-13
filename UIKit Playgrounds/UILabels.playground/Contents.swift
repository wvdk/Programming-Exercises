//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var str = "Hello, playground"



let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))

myLabel.text = "Hello world"
myLabel.backgroundColor = UIColor.red


PlaygroundPage.current.liveView = myLabel

