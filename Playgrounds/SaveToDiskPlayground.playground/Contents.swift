//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

var str = "Hello, playground"

FileManager.simpleSaveToDesktop(fileName: "NewFile.txt", content: str)

FileManager.simpleReadFromDesktop(fileName: "NewFile.txt")