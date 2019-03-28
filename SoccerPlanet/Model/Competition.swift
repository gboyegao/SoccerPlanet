//
//  CompetitionList.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 23/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Competition:Object{
    @objc dynamic var name = ""
    @objc dynamic var  id = Int()
}
