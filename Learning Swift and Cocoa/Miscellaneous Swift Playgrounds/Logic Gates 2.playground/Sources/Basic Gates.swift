import Foundation

//: # Basic Gates
//: Messing around with boolean logic while casually reading the [first chapter](http://www.nand2tetris.org/chapters/chapter%2001.pdf) of *Elements of Computing Systems*. Also helpful: [wikipedia.org/wiki/NAND_logic](http://en.wikipedia.org/wiki/NAND_logic).

//: # Nand
//: Nand is going to be our primitive. So I'm just going to use a simple `if else` statement. All other gates henceforth must be made out of Nand, or composite gates thereof.
//: ![Nand truth table](nand.gif)

public func nand(a a: Bool, b: Bool) -> Bool {
    if a == true && b == true {
        return false
    } else {
        return true
    }
}



//: # Not
//: The single-input Not gate, also known as ‘‘converter,’’ converts its input from 0 to 1 and vice versa.
//: ![](not.gif)
public func not(a a: Bool) -> Bool {
    return nand(a: a, b: true)
}


//: # And
//: ![](and.gif)
func and(a a: Bool, b: Bool) -> Bool {
    return not(a: nand(a: a, b: b))
}



//: # Or
//: ![](or.gif)
func or(a a: Bool, b: Bool) -> Bool {
    return not(a: and(a: not(a: and(a: a, b: a)), b: not(a: and(a: b, b: b))))
}



//: # Nor
//: ![](nor.gif)
func nor(a a: Bool, b: Bool) -> Bool {
    return not(a: or(a: a, b: b))
}



//: # Xor
//: ![](exor.gif)
func xor(a a: Bool, b: Bool) -> Bool {
    return not(a: and(a: not(a: and(a: a, b: not(a: and(a: b, b: b)))), b: not(a: and(a: b, b: not(a: and(a: a, b: b))))))
    
}



//: # Xnor
//: ![](exnor.gif)
func xnor(a a: Bool, b: Bool) -> Bool {
    return not(a: not(a: and(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: (not(a: and(a: b, b: not(a: and(a: a, b: b )))))), b: not(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: not(a: and(a: b, b:  not(a: and(a: a, b: b)))))))))
}
//
//not(a: not(a: and(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: (not(a: and(a: b, b: not(a: and(a: a, b: b )))))), b: not(a: and(a: not(a: and(a: a, b: not(a: and(a: a, b: b)))), b: not(a: and(a: b, b:  not(a: and(a: a, b: b)))))))))
//


//: ---
//: ![](summarytable.gif)
