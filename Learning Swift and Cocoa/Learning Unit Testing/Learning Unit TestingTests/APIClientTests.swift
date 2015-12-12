//
//  APIClientTests.swift
//  Learning Unit Testing
//
//  Created by Wesley Van der Klomp on 12/11/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import XCTest
@testable import Learning_Unit_Testing

class APIClientTests: XCTestCase {
    
    let client = APIClient()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatArrayOfStrikesExistsAfterCallToGetThem() {

        client.getRawJSON({
            XCTAssertNotNil(self.client.arrayOfStrikes)
        })
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceOfGETCall() {
        self.measureBlock {
            self.client.getRawJSON({})
        }
    }
    
}
