import UIKit

var str = "Hello, playground"

// https://www.vadimbulavin.com/swift-5-property-wrappers/

struct Car {
    
    
    var topSpeed: Int {
        get {
            return _topSpeed
        }
        set {
            _topSpeed = newValue
        }
    }
    private var _topSpeed: Int = 0
    
}

var car = Car()

print(car.topSpeed)

car.topSpeed = 100

print(car.topSpeed)
