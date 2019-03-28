//
//  TodayFixtures.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation

class TodayFixturesViewModel:NSObject{
    var matches:[Matches] = []
    var sections:[FixtureSection] = []
    
    
    weak var view:TodayFixturesVCProtocol?
    
    init(view:TodayFixturesVCProtocol) {
        self.view = view
    }
    
    func performInitialViewSetup(){
        view?.animateActivityIndicator()
        NetworkController.getFixtures{
            fixtures,error in
            guard let fixtures = fixtures else { return }
            self.matches = fixtures.matches
            let groups = Dictionary(grouping: self.matches, by: {
                match in
                dateToDay(match.utcDate)
            })
            self.sections = groups.map(FixtureSection.init).sorted(by: { $0.title < $1.title })
            DispatchQueue.main.async {
                self.view?.stopAnimatingActivityIndicator()
                self.view?.reloadTableView()
            }
        }
    }
    
    func numberOfSections() -> Int{
        return sections.count
    }
    
    func titleForHeaderInSection(_ section:Int) -> String{
        return sections[section].title
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int{
        return sections[section].matches.count
    }
    func match(at indexPath: IndexPath) -> Matches {
        return sections[indexPath.section].matches[indexPath.row]
    }

    func match(timefor indexPath:IndexPath) -> String{
        return dateToTime(match(at: indexPath).utcDate)
    }
    
    func match(statusfor indexPath:IndexPath) -> String{
        return match(at: indexPath).status
    }
    
    func match(hometeamnamefor indexPath:IndexPath) -> String{
        return match(at: indexPath).homeTeam.name
    }
    
    func match(awayteamnamefor indexPath:IndexPath) -> String{
        return match(at: indexPath).awayTeam.name
    }
    
    func match(hometeamscorefor indexPath:IndexPath) -> String{
        guard let score = match(at: indexPath).score.fullTime.homeTeam else { return "0"}
        return "\(score)"
    }
    
    func match(awayteamscorefor indexPath:IndexPath) -> String{
        guard let score = match(at: indexPath).score.fullTime.awayTeam else { return "0"}
        return "\(score)"
    }

}
