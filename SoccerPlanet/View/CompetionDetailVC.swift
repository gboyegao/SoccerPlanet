//
//  ViewController.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import UIKit

class CompetitionDetailVC: UIViewController,Storyboarded,CompetitionDetailVCProtocol{
    var coordinator:MainCoordinator?
    var viewModel:CompetitionDetailViewModel?
    var competition:Competition?
    
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = competition?.name
        viewModel = CompetitionDetailViewModel(view: self)
        viewModel?.performInitialViewSetup(id:competition!.id)
        
        tableview.delegate = self
        tableview.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        segmentControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: UIControl.Event.valueChanged)
        
    }
    
    func reloadTableView() {
        tableview.reloadData()
        collectionView.reloadData()
    }
}

extension CompetitionDetailVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else {return 0}
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {return 0}
        
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let viewModel = viewModel else {return nil}
        
        return viewModel.titleForHeaderInSection(section)

    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if viewModel?.currentSegment ==  .fixtures{
            return 150
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let viewModel = viewModel else {return UITableViewCell()}
        
        if viewModel.currentSegment == .table{
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        
        cell.updateCell(
            position: viewModel.position(for: indexPath),
            teamName: viewModel.teamName(for: indexPath),
            gamePlayed: viewModel.gamesPlayed(for: indexPath),
            goalDifference: viewModel.goalDifference(for: indexPath),
            points: viewModel.points(for: indexPath),
            teamLogoURL: viewModel.teamImageURL(for: indexPath)
        )
        
        return cell
    }
        else if viewModel.currentSegment == .fixtures{
            let cell = tableView.dequeueReusableCell(withIdentifier: "competitionFixtureCell") as! TodayFixturesTableCell
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
        
        return UITableViewCell()
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
            case 0:
                viewModel?.currentSegment = .table
                showTableView()
                hideCollectionView()
            case 1:
                viewModel?.currentSegment = .fixtures
                showTableView()
                hideCollectionView()
            case 2:
                viewModel?.currentSegment = .teams
                showCollectionView()
                hideTableView()
            default:
                viewModel?.currentSegment = .table
        }

    }
    
    
    @IBAction func unwind(segue:UIStoryboardSegue){
        
    }
    
    func hideTableView(){
        tableview.isHidden = true
    }
    
    func showTableView(){
        tableview.isHidden = false
    }
    
    func hideCollectionView(){
        collectionView.isHidden = true
    }
    
    func showCollectionView(){
        collectionView.isHidden = false
    }
    
    
    
}



extension CompetitionDetailVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamcollectioncell", for: indexPath) as! TeamCollectionViewCell
        guard let viewModel = viewModel else { return cell }
        let teamName = viewModel.teamName(forItemAt: indexPath)
        let teamLogo = viewModel.teamImage(forItemAt: indexPath)
        
        cell.setUpCell(teamName: teamName, teamLogoURL: teamLogo)
        
        return cell
    }
    
    
}



