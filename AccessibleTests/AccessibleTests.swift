//
//  AccessibleTests.swift
//  AccessibleTests
//
//  Created by Adrian on 11.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import XCTest

class AccessibleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCanLoadJSON() {
        let obj = loadJSON()
        XCTAssertNotNil(obj)
        XCTAssertEqual(obj?.count, 100)
        
        let firstObj = obj?[0]
        XCTAssertNotNil(firstObj?["country"])
    }
}
