//
//  StandingTests.swift
//  SoccerPlanetTests
//
//  Created by Adegboyega Olusunmade on 28/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import XCTest

@testable import SoccerPlanet

class StandingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStanding_WithCrestImage_CanBeInstantiated(){
        let standing = Standing(position: 10, teamName: "Manchester United", teamID: 3, crestImageURL: "www.manchesterunited.com/logo.png", gamesPlayed: 17, goalDifference: 30, points: 39)
        XCTAssertNotNil(standing)
    }
    
    func testStanding_WithoutCrestImage_CanBeInstantiated(){
        let standing = Standing(position: 10, teamName: "Manchester United", teamID: 3, crestImageURL: nil, gamesPlayed: 17, goalDifference: 30, points: 39)
        XCTAssertNotNil(standing)
    }
}
