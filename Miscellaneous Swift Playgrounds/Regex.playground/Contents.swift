//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

////////////////////
// https://www.hackingwithswift.com/example-code/strings/nsregularexpression-how-to-match-regular-expressions-in-strings

func rangeFromNSRange(nsRange: NSRange, forString str: String) -> Range<String.Index>? {
    let fromUTF16 = str.utf16.startIndex.advancedBy(nsRange.location, limit: str.utf16.endIndex)
    let toUTF16 = fromUTF16.advancedBy(nsRange.length, limit: str.utf16.endIndex)
    
    
    if let from = String.Index(fromUTF16, within: str),
        let to = String.Index(toUTF16, within: str) {
            return from ..< to
    }
    
    return nil
}


do {
    let input = "My name is John Smith"
    let regex = try NSRegularExpression(pattern: "my name is (.*)", options: NSRegularExpressionOptions.CaseInsensitive)
    let matches = regex.matchesInString(input, options: [], range: NSMakeRange(0, input.characters.count))
    
    if let match = matches.first {
        let range = match.rangeAtIndex(1)
        if let swiftRange = rangeFromNSRange(range, forString: input) {
            let name = input.substringWithRange(swiftRange)
        }
    }
} catch {
    print("something went bad with regex")
}


///////////////////
//http://stackoverflow.com/questions/24042144/stringbyreplacingoccurrencesofstring-is-not-working

let myString: NSString = "Chapter 1 -- It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife. However little known the feelings or views of such man may be on his first entering a neighbourhood, this truth is so well fixed in the minds of the surrounding families, that he is considered the rightful property of some one or other of their daughters."

let replaced = myString.stringByReplacingOccurrencesOfString("[^a-zA-Z_0-9]+", withString: " ", options: NSStringCompareOptions.RegularExpressionSearch, range: NSMakeRange(0, myString.length))

