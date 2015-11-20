import Foundation

public func nand(a a: Bool, b: Bool) -> Bool {
    if a == true && b == true {
        return false
    } else {
        return true
    }
}

public func not(a a: Bool) -> Bool {
    return nand(a: a, b: true)
}

public func and(a a: Bool, b: Bool) -> Bool {
    return not(a: nand(a: a, b: b))
}

public func or(a a: Bool, b: Bool) -> Bool {
    return not(a: and(a: not(a: and(a: a, b: a)), b: not(a: and(a: b, b: b))))
}

public func nor(a a: Bool, b: Bool) -> Bool {
    return not(a: or(a: a, b: b))
}

public func xor(a a: Bool, b: Bool) -> Bool {
    return not(a: and(a: not(a: and(a: a, b: not(a: and(a: b, b: b)))), b: not(a: and(a: b, b: not(a: and(a: a, b: b))))))
    
}

public func xnor(a a: Bool, b: Bool) -> Bool {
    return not(a: not(a: and(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: (not(a: and(a: b, b: not(a: and(a: a, b: b )))))), b: not(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: not(a: and(a: b, b:  not(a: and(a: a, b: b)))))))))
}
