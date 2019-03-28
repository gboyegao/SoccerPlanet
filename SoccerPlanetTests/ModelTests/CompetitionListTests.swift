//
//  CompetitionList.swift
//  SoccerPlanetTests
//
//  Created by Adegboyega Olusunmade on 28/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import XCTest

@testable import SoccerPlanet


class CompetitionList: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCompetition_CanBeInstantiated(){
        let competition = Competition()
        XCTAssertNotNil(competition)
    }
    
    
}
