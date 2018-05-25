//
//  HereSDKUITests.swift
//  HereSDKUITests
//
//  Created by Rhullian Damião on 25/05/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import XCTest

class HereSDKUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launchArguments.append("--uitesting")
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMapViewTestCase() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        app.launch()
        
        XCTAssertTrue(app.isMapViewShowing)
        
        app.otherElements["mapView"].swipeUp()
        app.otherElements["mapView"].swipeDown()
        app.otherElements["mapView"].pinch(withScale: 10, velocity: 3)
        app.otherElements["mapView"].swipeLeft()
        
    }
}
extension XCUIApplication {
    var isMapViewShowing: Bool {
        return otherElements["mapView"].exists
    }
    
}
