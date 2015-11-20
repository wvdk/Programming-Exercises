// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to Gates.playground.

import Foundation

public func test(gate: Bool, shouldReturn: Bool) -> String {
    if gate == shouldReturn {
        return "Success (returned \(shouldReturn))"
    } else {
        return "Fail (returned \(shouldReturn))"
    }
}