//
//  Learning_Unit_TestingTests.swift
//  Learning Unit TestingTests
//
//  Created by Wesley Van der Klomp on 12/11/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import XCTest
@testable import Learning_Unit_Testing

class Learning_Unit_TestingTests: XCTestCase {
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let myClass = MyClassToTest(thing: "Hello")
        
        var thing: String = myClass.thisIsAPropertyThatMustExist
        
        thing = ""
        
        if thing.characters.count != 0 {
            XCTAssert(true, "good")
        } else {
            XCTAssert(false)
        }
//        XCTAssert(myClass.thisIsAMethodToTest())
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
//    
}
