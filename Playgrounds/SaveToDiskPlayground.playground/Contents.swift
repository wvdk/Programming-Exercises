//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

var str = "Hello, playground"

let path = "\(NSHomeDirectory())/Desktop/file.txt"

File.save(path: path, content: str)

File.open(path: path)