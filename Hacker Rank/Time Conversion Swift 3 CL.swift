import Foundation

// Read the string
let s = readLine()!

func convertTo24HourTime(input: String) -> String {
    let a = input._split(separator: ":")
    var hours = Int(String(a[0]))!
    let minutes = Int(String(a[1]))!
    let secondsWithAmPm = String(a[2])!
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

print(convertTo24HourTime(input: s))
