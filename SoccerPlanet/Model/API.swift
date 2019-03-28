//
//  APIKey.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 23/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation

struct API {
    //API key is passed as a header parameter with an id of "X-Auth-Token"
   static let key = "d42d8d8e24d34e328cb2b065010a0067"
   static let baseURL = "https://api.football-data.org/v2"
   static let competitionListEndpoint = "https://api.football-data.org/v2/competitions"
   static func competitionStandingsEndpoint(for competition:Int) -> String{
    return "https://api.football-data.org/v2/competitions/\(competition)/standings?standingType=TOTAL"
    }
   static func competitionFixturesEndpoint(for competition:Int) -> String{
    return "https://api.football-data.org/v2/competitions/\(competition)/matches?status=SCHEDULED"
   }
  
    static var fixturesEndpoint:String {
        return "\(baseURL)/matches?dateFrom=\(DateController().fromDate)&dateTo=\(DateController().toDate)"
    }
    
//   static let fixturesEndpoint = "\(baseURL)/matches"
}
