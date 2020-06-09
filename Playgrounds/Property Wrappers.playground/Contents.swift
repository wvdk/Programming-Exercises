import UIKit

var str = "Hello, playground"

// https://www.vadimbulavin.com/swift-5-property-wrappers/

struct Car {
    
    var topSpeed: Int {
        get {
            return self.topSpeed
        }
        set {
            topSpeed = newValue
        }
    }
    
}

let car = Car()
print(car.topSpeed)
