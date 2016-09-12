//
//  AccessibleUITests.swift
//  AccessibleUITests
//
//  Created by Adrian on 11.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import XCTest

class AccessibleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMakeCustomerFavorite() {
        let app = XCUIApplication()
        app.tables.cells.element(boundBy: 0).tap()
        app.buttons["Favorite"].tap()
        XCTAssertEqual(app.buttons["Favorite"].value as? String, "Favorite customer")
        app.buttons["Favorite"].tap()
        XCTAssertEqual(app.buttons["Favorite"].value as? String, "Not favorite customer")
    }
}
