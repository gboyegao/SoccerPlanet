//
//  RealmCompetition.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 27/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation
import RealmSwift

class RealmCompetitionList:Object{
    let competitions = List<RealmCompetition>()
}

class RealmCompetition:Object{
    @objc dynamic var name = ""
    @objc dynamic var id = Int()
}


