//: https://www.hackerrank.com/challenges/time-conversion

import Cocoa

func convertTo24HourTime(input: String) -> String {
    let a = input.split(separator: ":")
    var hours = Int(String(a[0]))!
    let minutes = Int(String(a[1]))!
    let secondsWithAmPm = String(a[2])
    let index = secondsWithAmPm.index(secondsWithAmPm.startIndex, offsetBy: 2)
    let amPm = secondsWithAmPm.substring(from: index)
    let seconds = Int(String(secondsWithAmPm.substring(to: index)))!
    
    if amPm == "PM" && hours != 12 {
        hours += 12
    } else if amPm == "AM" && hours == 12 {
        hours -= 12
    }
    
    
    let formattedHours = String(format: "%02d", hours)
    let formattedMinutes = String(format: "%02d", minutes)
    let formattedSeconds = String(format: "%02d", seconds)
    
    return "\(formattedHours):\(formattedMinutes):\(formattedSeconds)"
}


let sampleInput = "07:05:45PM"
let sampleOutput = "19:05:45"

sampleOutput == convertTo24HourTime(input: sampleInput)

let sampleInput2 = "12:00:00PM"
let sampleOutput2 = "12:00:00"

sampleOutput2 == convertTo24HourTime(input: sampleInput2)

let sampleInput3 = "12:00:00AM"
let sampleOutput3 = "00:00:00"

sampleOutput3 == convertTo24HourTime(input: sampleInput3)

let sampleInput4 = "12:45:54PM"
let sampleOutput4 = "12:45:54"

convertTo24HourTime(input: sampleInput4)
sampleOutput4 == convertTo24HourTime(input: sampleInput4)
