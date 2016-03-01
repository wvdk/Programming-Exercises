//: # Basic Gates
//: Messing around with boolean logic while casually reading the [first chapter](http://www.nand2tetris.org/chapters/chapter%2001.pdf) of *Elements of Computing Systems*. Also helpful: [wikipedia.org/wiki/NAND_logic](http://en.wikipedia.org/wiki/NAND_logic).

//: # Nand
//: Nand is going to be our primitive. So I'm just going to use a simple `if else` statement. All other gates henceforth must be made out of Nand, or composite gates thereof.
//: ![Nand truth table](nand.gif)
func nand(#a: Bool, #b: Bool) -> Bool {
    if a == true && b == true {
        return false
    } else {
        return true
    }
}

test(nand(a: false, b: false), shouldReturn: true)
test(nand(a: false, b: true), shouldReturn: true)
test(nand(a: true, b: false), shouldReturn: true)
test(nand(a: true, b: true), shouldReturn: false)

//: # Not
//: The single-input Not gate, also known as ‘‘converter,’’ converts its input from 0 to 1 and vice versa.
//: ![](not.gif)
func not(#a: Bool) -> Bool {
    return nand(a: a, b: true)
}

test(not(a: true), shouldReturn: false)
test(not(a: false), shouldReturn: true)

//: # And
//: ![](and.gif)
func and(#a: Bool, #b: Bool) -> Bool {
    return not(a: nand(a: a, b: b))
}

test(and(a: false, b: false), shouldReturn: false)
test(and(a: false, b: true), shouldReturn: false)
test(and(a: true, b: false), shouldReturn: false)
test(and(a: true, b: true), shouldReturn: true)

//: # Or
//: ![](or.gif)
func or(#a: Bool, #b: Bool) -> Bool {
    return not(a: and(a: not(a: and(a: a, b: a)), b: not(a: and(a: b, b: b))))
}

test(or(a: false, b: false), shouldReturn: false)
test(or(a: false, b: true), shouldReturn: true)
test(or(a: true, b: false), shouldReturn: true)
test(or(a: true, b: true), shouldReturn: true)

//: # Nor
//: ![](nor.gif)
func nor(#a: Bool, #b: Bool) -> Bool {
    return not(a: or(a: a, b: b))
}

test(nor(a: false, b: false), shouldReturn: true)
test(nor(a: false, b: true), shouldReturn: false)
test(nor(a: true, b: false), shouldReturn: false)
test(nor(a: true, b: true), shouldReturn: false)

//: # Xor
//: ![](exor.gif)
func xor(#a: Bool, #b: Bool) -> Bool {
    return not(a: and(a: not(a: and(a: a, b: not(a: and(a: b, b: b)))), b: not(a: and(a: b, b: not(a: and(a: a, b: b))))))
    
}

test(xor(a: false, b: false), shouldReturn: false)
test(xor(a: false, b: true), shouldReturn: true)
test(xor(a: true, b: false), shouldReturn: true)
test(xor(a: true, b: true), shouldReturn: false)

//: # Xnor
//: ![](exnor.gif)
func xnor(#a: Bool, #b: Bool) -> Bool {
    return not(a: not(a: and(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: (not(a: and(a: b, b: not(a: and(a: a, b: b )))))), b: not(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: not(a: and(a: b, b:  not(a: and(a: a, b: b)))))))))
}
//
//not(a: not(a: and(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: (not(a: and(a: b, b: not(a: and(a: a, b: b )))))), b: not(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: not(a: and(a: b, b:  not(a: and(a: a, b: b)))))))))
//
test(xnor(a: false, b: false), shouldReturn: true)
test(xnor(a: false, b: true), shouldReturn: false)
test(xnor(a: true, b: false), shouldReturn: false)
test(xnor(a: true, b: true), shouldReturn: true) // WHY IS THIS FAILING?

//: ---
//: ![](summarytable.gif)
