// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to Gates.playground.

import Foundation

public func test(gate: Bool, shouldReturn: Bool) -> String {
    if gate == shouldReturn {
        return "Success (returned \(shouldReturn))"
    } else {
        return "Fail (returned \(shouldReturn))"
    }
}

public func runAllTests() -> Bool {
    
    
    test(nand(a: false, b: false), shouldReturn: true)
    test(nand(a: false, b: true), shouldReturn: true)
    test(nand(a: true, b: false), shouldReturn: true)
    test(nand(a: true, b: true), shouldReturn: false)

    test(not(a: true), shouldReturn: false)
    test(not(a: false), shouldReturn: true)
    
    test(and(a: false, b: false), shouldReturn: false)
    test(and(a: false, b: true), shouldReturn: false)
    test(and(a: true, b: false), shouldReturn: false)
    test(and(a: true, b: true), shouldReturn: true)

    test(or(a: false, b: false), shouldReturn: false)
    test(or(a: false, b: true), shouldReturn: true)
    test(or(a: true, b: false), shouldReturn: true)
    test(or(a: true, b: true), shouldReturn: true)
    
    test(nor(a: false, b: false), shouldReturn: true)
    test(nor(a: false, b: true), shouldReturn: false)
    test(nor(a: true, b: false), shouldReturn: false)
    test(nor(a: true, b: true), shouldReturn: false)
    
    test(xor(a: false, b: false), shouldReturn: false)
    test(xor(a: false, b: true), shouldReturn: true)
    test(xor(a: true, b: false), shouldReturn: true)
    test(xor(a: true, b: true), shouldReturn: false)
    
    test(xnor(a: false, b: false), shouldReturn: true)
    test(xnor(a: false, b: true), shouldReturn: false)
    test(xnor(a: true, b: false), shouldReturn: false)
    test(xnor(a: true, b: true), shouldReturn: true) // WHY IS THIS FAILING?
    
    return false

    
}