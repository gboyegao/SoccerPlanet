//
//  CompetitionDetailViewModel.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation

class CompetitionDetailViewModel:NSObject{
    
    enum Segment {
        case table
        case fixtures
        case teams
    }
    
    var teams:[Team] = []
    var standings:[Standing] = []{
        didSet{
            standings.map({
                standing in
                   self.teams.append(Team(teamName:standing.teamName,teamID:standing.teamID,crestImageURL:standing.crestImageURL))
            })
        }
    }

    var matches:[Matches] = []
    var sections:[FixtureSection] = []
    
    var currentSegment:Segment = .table {
        didSet{
           self.view?.reloadTableView()
        }
    }
    
    weak var view:CompetitionDetailVCProtocol?
    
    init(view:CompetitionDetailVCProtocol) {
        self.view = view
    }
    
    
    func performInitialViewSetup(id:Int){
        NetworkController.getcompetionFixtures(with: id){
            fixtures,error in
            guard let fixtures = fixtures else { return }
            self.matches = fixtures.matches
            let groups = Dictionary(grouping: self.matches, by: {
                match in
                dateToDay(match.utcDate)
            })
            self.sections = groups.map(FixtureSection.init).sorted(by: { $0.title < $1.title })
            DispatchQueue.main.async {
                self.view?.reloadTableView()
            }

        }
        
        NetworkController.getCompetitionStandings(with:id){
            standings,error in
            guard let standings = standings else { return }
            self.standings = standings
            DispatchQueue.main.async {
                self.view?.reloadTableView()
            }
        }
        

    }
    func numberOfSections() -> Int{
        if currentSegment == .table {
            return 1
        }
        return sections.count
    }
    
    
    func numberOfRowsInSection(_ section:Int) -> Int{
        switch currentSegment {
        case .table:
            return standings.count
        case .fixtures:
            guard !sections.isEmpty else { return 0 }
            return sections[section].matches.count
        case .teams:
            return teams.count
        }
    }
    
    func titleForHeaderInSection(_ section:Int) -> String?{
        if currentSegment == .fixtures{
            return sections[section].title
        }
        return nil
    }
    
    func standing(for indexPath:IndexPath) -> Standing{
        return standings[indexPath.row]
    }
    
    func position(for indexPath:IndexPath) -> String{
        return String(standings[indexPath.row].position)
    }
    func teamImageURL(for indexPath:IndexPath) -> String?{
        
        guard let imageURL = standings[indexPath.row].crestImageURL else {return nil}
        return imageURL
    }
    func teamName(for indexPath:IndexPath) -> String{
        return standings[indexPath.row].teamName
    }
    func gamesPlayed(for indexPath:IndexPath) -> String{
        return String(standings[indexPath.row].gamesPlayed)
    }
    func goalDifference(for indexPath:IndexPath) -> String{
        return String(standings[indexPath.row].goalDifference)
    }
    func points(for indexPath:IndexPath) -> String{
        return String(standings[indexPath.row].points)
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
    
    
    func teamName(forItemAt indexPath:IndexPath) -> String{
        return teams[indexPath.row].teamName
    }
    
    func teamImage(forItemAt indexPath:IndexPath) -> String{
        guard let image = teams[indexPath.row].crestImageURL else { return ""}
        return image
    }

}
