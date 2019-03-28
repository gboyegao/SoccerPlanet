//
//  ViewController.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import UIKit

class TodayFixturesVC: UITableViewController,TodayFixturesVCProtocol{
    var viewModel:TodayFixturesViewModel!
    
    var activityIndicatorView:UIActivityIndicatorView!
    
    override func loadView() {
        super.loadView()
        activityIndicatorView = UIActivityIndicatorView(style: .white)
        tableView.backgroundView = activityIndicatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TodayFixturesViewModel(view: self)
        viewModel.performInitialViewSetup()
        
        tableView.rowHeight = 150
    }
    
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FixtureCell") as! TodayFixturesTableCell
        cell.updateCell(
            status: viewModel.match(statusfor: indexPath),
            matchTime: viewModel.match(timefor: indexPath),
            homeTeam: viewModel.match(hometeamnamefor: indexPath),
            awayTeam: viewModel.match(awayteamnamefor: indexPath),
            homeScore: viewModel.match(hometeamscorefor: indexPath),
            awayScore: viewModel.match(awayteamscorefor: indexPath)
        )
        return cell
    }
    
    func animateActivityIndicator(){
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimatingActivityIndicator(){
        activityIndicatorView.stopAnimating()
    }
}

