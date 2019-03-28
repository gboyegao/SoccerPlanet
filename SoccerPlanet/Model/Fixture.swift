//
//  Fixture.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 25/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation

struct Fixtures:Codable{
    let matches:[Matches]
}

struct Matches:Codable {
    let utcDate:Date
    let status:String
    let homeTeam:FixtureTeam
    let awayTeam:FixtureTeam
    let score:Score
}

struct FixtureTeam:Codable {
    let id:Int
    let name:String
}

struct Score:Codable{
    let fullTime:ScoreTime
}

struct ScoreTime:Codable{
    let homeTeam:Int?
    let awayTeam:Int?
}
