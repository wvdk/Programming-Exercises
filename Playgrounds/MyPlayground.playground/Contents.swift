import Foundation

let testString1 = "Wes Van der Klomp"
let testString2 = "John Doe"

let myWords = testString1.components(separatedBy: " ")

func initials(from name: String) -> String? {
    var initials = ""
    let words = name.components(separatedBy: " ")
    for word in words {
        if let initial = word.first {
            initials.append(initial)
        }
    }

    
    if let first = initials.first, let second = initials.dropFirst().first {
        return "\(first)\(second)"
    } else {
        return nil
    }
}

initials(from: testString1)
initials(from: testString2)
