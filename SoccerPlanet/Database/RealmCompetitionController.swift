//
//  RealmCompetitionController.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 27/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation
import RealmSwift


class RealmCompetitionController{
    static func addCompetitions(_ competions:[Competition]){
        let realm = try! Realm()
         let allCompetitions = realm.objects(Competition.self)
        
        //Delete Previous Entries
        do{
            try realm.write {
                realm.delete(allCompetitions)
            }
        }
        catch{
            print(error.localizedDescription)
        }
        
        //Add New Entries
        competions.map({
            competition in
            do{
                try realm.write {
                    realm.add(competition)
                }
            }
            catch{
                print(error.localizedDescription)
            }
            
        })
    }
    
    static func loadCompetitions() -> [Competition]{
        let realm = try! Realm()
        let items = realm.objects(Competition.self)
        return items.map{$0}
        
    }
}
