//
//  APITest.swift
//  SoccerPlanetTests
//
//  Created by Adegboyega Olusunmade on 28/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import XCTest

@testable import SoccerPlanet

class APITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testAPIkey(){
       let key = "d42d8d8e24d34e328cb2b065010a0067"
       let APIKey = API.key
       XCTAssertEqual(APIKey, key)
    }
    
    func testBaseURL(){
        let baseURL = "https://api.football-data.org/v2"
        let APIBaseURL = API.baseURL
        XCTAssertEqual(APIBaseURL, baseURL)
    }
    
    func testCompetitionListEndpoint(){
        let competitionListEndpoint = "https://api.football-data.org/v2/competitions"
        let APICompetitionList = API.competitionListEndpoint
        XCTAssertEqual(APICompetitionList, competitionListEndpoint)

    }
    
    func testcompetitionStandingsEndpoint(){
        let competitionStandingsEndpoint = "https://api.football-data.org/v2/competitions/2021/standings?standingType=TOTAL"
        let APICompetitionStandings = API.competitionStandingsEndpoint(for: 2021)
        XCTAssertEqual(APICompetitionStandings, competitionStandingsEndpoint)
    }
    
    func testCompetitionFixturesEndpoint(){
        let competitionFixturesEndpoint = "https://api.football-data.org/v2/competitions/2021/matches?status=SCHEDULED"
        let APICompetitionFixturesEndpoint = API.competitionFixturesEndpoint(for: 2021)
        XCTAssertEqual(APICompetitionFixturesEndpoint, competitionFixturesEndpoint)
    }
    
    func testFixturesEndpoint(){
        let fixturesEndpoint = "https://api.football-data.org/v2/matches?dateFrom=\(DateController().fromDate)&dateTo=\(DateController().toDate)"
        let APIFixturesEndpoint = API.fixturesEndpoint
        XCTAssertEqual(APIFixturesEndpoint, fixturesEndpoint)

        
    }

}
