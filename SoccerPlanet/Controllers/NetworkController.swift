//
//  NetworkController.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 23/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation


class NetworkController{
    static func getCompetitions(completion:@escaping ([Competition]?,Error?) -> Void){
        let safeURLString = API.competitionListEndpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let competitionListURL = URL(string: safeURLString!) else { return }
        
        var request = URLRequest(url: competitionListURL)
        request.setValue("X-Auth-Token", forHTTPHeaderField: API.key)
        
        
        let dataTask = URLSession.shared.dataTask(with: request){
            data,response,error in
           
            if error != nil {
                completion(nil,error)
                
            }

            if let status = response as? HTTPURLResponse {
            if(status.statusCode == 200){
                if let data = data {
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! Dictionary<String, Any>
                        var competitionArray = [Competition]()
                        
                        if let competitions = json["competitions"] as? [[String:AnyObject]]{
                            
                            for competition in competitions{
                                let name = competition["name"] as! String
                                let id = competition["id"] as! Int
                                let plan = competition["plan"] as! String
                                
                                if plan == "TIER_ONE" {
                                    let tierOneCompetition = Competition()
                                    tierOneCompetition.name = name
                                    tierOneCompetition.id = id
                                    competitionArray.append(tierOneCompetition)
                                }
                            }
                            completion(competitionArray,nil)
                        }

                        
                    }
                    catch{

                    }
                }
                }
                guard 200 ..< 300 ~= status.statusCode else {
                    print("Status code was \(status.statusCode), but expected 2xx")
                    return
                }
                
            }
            
            
            
        }
        
        dataTask.resume()
    }
}

//Competition Standings Function
extension NetworkController{
    static func getCompetitionStandings(with competitionID:Int,completion:@escaping ([Standing]?,Error?) -> Void){
        
        //let url = "https://api.football-data.org/v2/competitions/\(teamID)/standings?standingType=HOME"
        
        let url = API.competitionStandingsEndpoint(for: competitionID)
        
        let safeURLString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        
        guard let teamStandingURL = URL(string: safeURLString!) else { return }
        
        var request = URLRequest(url: teamStandingURL)
        request.httpMethod = "GET"
        request.setValue(API.key, forHTTPHeaderField: "X-Auth-Token")
        
        
        let dataTask = URLSession.shared.dataTask(with: request){
            data,response,error in
            
            if error != nil {
                print(error?.localizedDescription)
                completion(nil,error)
                
            }
            
            if let status = response as? HTTPURLResponse {
                if(status.statusCode == 200){
                    if let data = data {
                        do{
                            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! Dictionary<String, Any>
                            var standingsArray = [Standing]()

                            if let standing = json["standings"] as? [[String:AnyObject]],let totalStanding = standing[0] as? [String:AnyObject],let table = totalStanding["table"] as? [[String:AnyObject]]  {


                                for teams in table{

                                    let position = teams["position"] as! Int
                                    let playedGames = teams["playedGames"] as! Int
                                    let points = teams["points"] as! Int
                                    let goalDifference = teams["goalDifference"] as! Int

                                    let team = teams["team"] as! [String: AnyObject]
                                    let teamName = team["name"] as! String
                                    let teamID = team["id"] as! Int
                                    let crestImage:String?
                                    if let image = team["crestUrl"] as? String {
                                        crestImage = image
                                    }
                                    else{
                                        crestImage = nil
                                    }
 standingsArray.append(Standing(position:position,teamName:teamName,teamID:teamID,crestImageURL:crestImage,gamesPlayed:playedGames,goalDifference:goalDifference,points:points))

                                }

                                completion(standingsArray,nil)
                                
                            }
                       


                        }
                        catch{
                            print(error.localizedDescription)
                        }
                    }
                }
                guard 200 ..< 300 ~= status.statusCode else {
                    print("Status code was \(status.statusCode), but expected 2xx")
                    return
                }

            }
            
            
            
        }
        
        dataTask.resume()
    }
}

//Fixtures in competition Function
extension NetworkController{
    static func getcompetionFixtures(with competitionID:Int,completion:@escaping (Fixtures?,Error?) -> Void){
        
        
        let url = API.competitionFixturesEndpoint(for: competitionID)
        
        let safeURLString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        
        guard let teamStandingURL = URL(string: safeURLString!) else { return }
        
        var request = URLRequest(url: teamStandingURL)
        request.httpMethod = "GET"
        request.setValue(API.key, forHTTPHeaderField: "X-Auth-Token")
        
        
        let dataTask = URLSession.shared.dataTask(with: request){
            data,response,error in
            
            if error != nil {
                print(error?.localizedDescription)
                completion(nil,error)
                
            }
            
            if let status = response as? HTTPURLResponse {
                if(status.statusCode == 200){
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let fixtures = try! decoder.decode(Fixtures.self, from: data)
                        completion(fixtures,nil)
                    }
                }
                guard 200 ..< 300 ~= status.statusCode else {
                    print("Status code was \(status.statusCode), but expected 2xx")
                    return
                }
                
            }
            
            
            
        }
        
        dataTask.resume()
    }
}

//All Fixtures available to API TIER
extension NetworkController{
    static func getFixtures(completion:@escaping (Fixtures?,Error?) -> Void){
        
        let url = API.fixturesEndpoint
        
        let safeURLString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        
        guard let teamStandingURL = URL(string: safeURLString!) else { return }
        
        var request = URLRequest(url: teamStandingURL)
        request.httpMethod = "GET"
        request.setValue(API.key, forHTTPHeaderField: "X-Auth-Token")
        
        
        let dataTask = URLSession.shared.dataTask(with: request){
            data,response,error in
            
            if error != nil {
                print(error?.localizedDescription)
                completion(nil,error)
                
            }
            
            if let status = response as? HTTPURLResponse {
                if(status.statusCode == 200){
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let fixtures = try! decoder.decode(Fixtures.self, from: data)
                        completion(fixtures,nil)
                    }
                }
                guard 200 ..< 300 ~= status.statusCode else {
                    print("Status code was \(status.statusCode), but expected 2xx")
                    return
                }
                
            }
            
            
            
        }
        
        dataTask.resume()
    }
}






//Matches in competition function

