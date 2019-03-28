//
//  CompetitionVC.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation

class CompetitionsViewModel:NSObject{
    var competitions:[Competition] = RealmCompetitionController.loadCompetitions()
    
    weak var view:CompetitionsVCProtocol?
    
    init(view:CompetitionsVCProtocol) {
        self.view = view
    }
    func performInitialViewSetup(){
        //Perform Internet Call
        NetworkController.getCompetitions{
            competitions,error in
            if error != nil{
                print(error?.localizedDescription)
            }
            if let competitions = competitions{
                self.competitions = competitions
                
                DispatchQueue.main.async {
                    RealmCompetitionController.addCompetitions(competitions)
                    self.view?.reloadTableView()
                }
                
            }
        }
    }
    func numberOfSections() -> Int{
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int{
        return competitions.count
    }
    
    func competition(namefor indexPath:IndexPath) -> String{
        return competitions[indexPath.row].name
    }
    
    func competition(for indexPath:IndexPath) -> Competition{
        return competitions[indexPath.row]
    }
    
    
    
}

