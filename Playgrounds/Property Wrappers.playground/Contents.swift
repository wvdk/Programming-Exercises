import UIKit

var str = "Hello, playground"

// https://www.vadimbulavin.com/swift-5-property-wrappers/

@propertyWrapper
struct BoundedSpeed {
    
    private var value: Int
    
    init(wrappedValue: Int) {
        self.value = wrappedValue
    }
    
    var wrappedValue: Int {
        get {
            return value
        }
        set {
            print("Incoming value is \(newValue)")

            if newValue > 100 {
                self.value = 100
            } else if newValue < 0 {
                self.value = 0
            } else {
                self.value = newValue
            }

            print("Setting value to \(self.value)")
        }
    }
    
}

struct Car {
    
    
    @BoundedSpeed public var topSpeed: Int
    
}

var car = Car(topSpeed: 50)

print(car.topSpeed)

car.topSpeed = 100

print(car.topSpeed)

car.topSpeed = -10

print(car.topSpeed)

car.topSpeed = 110

print(car.topSpeed)
