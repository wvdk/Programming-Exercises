
enum MyError: Error {
    case fuck
}

func throwingFunction(shouldThrow: Bool) throws -> Bool {
    if shouldThrow {
        throw MyError.fuck
    } else {
        return true
    }
}

do {
    try throwingFunction(shouldThrow: true)
} catch {
    print(error)
}

let myInt = 1

let myInt2: (Int) = 1

myInt == myInt2




class IntegerRef: Equatable {
    let value: Int
    init(_ value: Int) {
        self.value = value
    }
    
    static func ==(lhs: IntegerRef, rhs: IntegerRef) -> Bool {
        return lhs.value == rhs.value
    }
}


let i1 = IntegerRef(34)
let i2 = i1
let i3 = IntegerRef(34)

i1 === i2
i1 == i2
i3 == i1
i3 === i1
