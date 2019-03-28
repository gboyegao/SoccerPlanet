//
//  TodayFixturesViewModelTests.swift
//  SoccerPlanetTests
//
//  Created by Adegboyega Olusunmade on 28/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import XCTest

@testable import SoccerPlanet

class TodayFixturesViewModelTests: XCTestCase {
    fileprivate var mockTodayFixturesVC:MockTodayFixturesVC!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockTodayFixturesVC = MockTodayFixturesVC()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_ValidView_InstantiatesObject(){
        let viewModel = TodayFixturesViewModel(view: mockTodayFixturesVC)
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_ValidView_CopiesViewToIvar(){
        let viewModel = TodayFixturesViewModel(view: mockTodayFixturesVC)
        let lhs = mockTodayFixturesVC
        let rhs = viewModel.view!
        XCTAssertTrue(lhs === rhs)
    }
    
    func testPerformInitialViewSetUp_CallsAnimateActivityIndicator(){
        let expectation = self.expectation(description: "Expected Animate activity indicator to be called")
        mockTodayFixturesVC.expectationForCallsAnimateActivity = expectation
        
        let viewModel = TodayFixturesViewModel(view: mockTodayFixturesVC)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}
