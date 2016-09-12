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
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
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
