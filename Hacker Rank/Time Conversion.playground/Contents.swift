//: https://www.hackerrank.com/challenges/time-conversion

import Cocoa

func convertTo24HourTime(input: String) -> String {
    
    let a = input.split(separator: ":")
    var hours = Int(String(a[0]))!
    let minutes = Int(String(a[1]))!
    let secondsWithAmPm = String(a[2])
    let index = secondsWithAmPm.index(secondsWithAmPm.startIndex, offsetBy: 2)
    var amPm = secondsWithAmPm.substring(from: index)
    let seconds = Int(String(secondsWithAmPm.substring(to: index)))!
    
    if amPm == "PM" {
        hours += 12
    }
    
    return "\(hours):\(minutes):\(seconds)"
}


let sampleInput = "07:05:45PM"
let sampleOutput = "19:05:45"

sampleOutput == convertTo24HourTime(input: sampleInput)
