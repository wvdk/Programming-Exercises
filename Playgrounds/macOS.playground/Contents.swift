//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground

var str = "Hello, playground"


struct SpirographGenerator {
    
    var pointOffset, dTheta, dR, minorRadius, majorRadius : Double
    var theta = 0.0
    typealias Element = CGPoint
    
    init(majorRadius : Double, minorRadius : Double, pointOffset : Double, samples : Double)
    {
        self.pointOffset = pointOffset
        self.dTheta = Double(M_PI) * (2.0) / samples
        self.majorRadius = majorRadius
        self.minorRadius = minorRadius
        self.dR = majorRadius - minorRadius
    }
    
    mutating func next() -> CGPoint? {
        let xT : Double = dR * cos(theta) + pointOffset * cos(dR * theta / minorRadius)
        let yT : Double = dR * sin(theta) + pointOffset * sin (dR * theta / minorRadius)
        theta = theta + dTheta
        return CGPoint(x: xT, y: yT)
    }
}

let s = SpirographGenerator(majorRadius: 10, minorRadius: 10, pointOffset: 10, samples: 10)
