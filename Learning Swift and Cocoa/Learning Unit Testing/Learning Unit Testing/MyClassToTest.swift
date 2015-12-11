//
//  MyClassToTest.swift
//  Learning Unit Testing
//
//  Created by Wesley Van der Klomp on 12/11/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class MyClassToTest: NSObject {
    var thisIsAPropertyThatMustExist: String!
    
    init(thing: String) {
        super.init()
        self.thisIsAPropertyThatMustExist = thing
    }
    
    func thisIsAMethodToTest() -> Bool {
        if thisIsAPropertyThatMustExist.characters.count < 0 {
            return true
        } else {
            return false
        }
    }

}
