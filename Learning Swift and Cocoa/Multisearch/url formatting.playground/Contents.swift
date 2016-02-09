//: Playground - noun: a place where people can play

import Cocoa

let input = "string needin some URL love"
let escapedInput = input.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!

// search urls
let googleURL2 = NSURL(string: "https://www.google.com/search?q=\(escapedInput)")
let yahooURL2 = NSURL(string: "https://search.yahoo.com/search?q=\(escapedInput)")
let bingURL2 = NSURL(string: "https://www.bing.com/search?q=\(escapedInput)")