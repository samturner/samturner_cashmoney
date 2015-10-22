//
//  ustwo_cashmoneyUITests.swift
//  ustwo_cashmoneyUITests
//
//  Created by Sam Turner on 20/10/2015.
//  Copyright © 2015 Sam Turner. All rights reserved.
//

import XCTest

class ustwo_cashmoneyUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func inputOutputTest() {
        let app = XCUIApplication()
        let inputLabel = app.textFields.elementBoundByIndex(0)
        
        inputLabel.tap()
        inputLabel.typeText("5")                // Enter 5 into the field
        
        XCTAssertEqual(app.staticTexts.elementBoundByIndex(2).label, "$ 4.0")           // This value will depend on the exchange rate
    }
    
}
