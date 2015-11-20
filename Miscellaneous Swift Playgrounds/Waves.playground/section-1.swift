import UIKit

// Sine wave
for n in 1...175 {
    sin(Double(n)*0.1)
}

// ZigZag wave
func makeZigZagArray() -> [Int] {
    var n = 1
    var arrayOfIntsGoingUpAndDown = [1]

    for i in 1...3 {
        if n >= 5 {
            for i in 1...5 {
                n = n - 1
                arrayOfIntsGoingUpAndDown.append(n)
            }
        } else if n <= 1 {
            for i in 1...5 {
                n = n + 1
                arrayOfIntsGoingUpAndDown.append(n)
            }
        }
    }
    return arrayOfIntsGoingUpAndDown
}
let x = makeZigZagArray()
for i in x  {
    i
}

// Half circle wave
// it's going to have something to do with PI
