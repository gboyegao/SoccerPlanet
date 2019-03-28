//
//  FixtureTests.swift
//  SoccerPlanetTests
//
//  Created by Adegboyega Olusunmade on 28/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import XCTest
@testable import SoccerPlanet

class FixtureTests: XCTestCase {
    
    var scoreTime:ScoreTime!
    var score:Score!
    var fixtureTeamA = FixtureTeam(id: 5, name: "Arsenal")
    var fixtureTeamB = FixtureTeam(id: 3, name: "Manchester United")
    var match:Matches!


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        scoreTime = ScoreTime(homeTeam: 3, awayTeam: 0)
        score =  Score(fullTime: scoreTime)
        match =  Matches(utcDate: Date(), status: "SCHEDULED", homeTeam: fixtureTeamA, awayTeam: fixtureTeamB, score: score)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFixtures_CanBeInstantiated(){
        let fixture = Fixtures(matches: [match])
        
        XCTAssertNotNil(fixture)
        
    }
    
    func testFixtureSection_CanBeInstantiated(){
        let fixtureSection = FixtureSection(title: "April 2", matches: [match])
        
        XCTAssertNotNil(fixtureSection)
    }

}
