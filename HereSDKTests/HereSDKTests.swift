//
//  HereSDKTests.swift
//  HereSDKTests
//
//  Created by Rhullian Damião on 25/05/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import XCTest
import NMAKit
@testable import HereSDK

class HereSDKTests: XCTestCase {
    var controller:ViewController!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSchemeChangeOfMap() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(controller.makeACountForUnityTest(2), 98, "Calculation is wrong")
        XCTAssertTrue(controller.makeACountForUnityTest(20)==80)
        XCTAssertFalse(controller.makeACountForUnityTest(10)==95)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
