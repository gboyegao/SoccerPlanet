//
//  CompetitionsVC.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 24/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import UIKit

class CompetitionsVC: UITableViewController{
    var viewModel:CompetitionsViewModel?
    var coordinator:MainCoordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CompetitionsViewModel(view: self)
        viewModel?.performInitialViewSetup()
        
        coordinator = MainCoordinator(navigationController: navigationController!)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let viewModel = viewModel else { return 0 }
        
        return viewModel.numberOfRowsInSection(section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        guard let viewModel = viewModel else { return cell }
        cell.backgroundColor = #colorLiteral(red: 0.2418941259, green: 0.2372770905, blue: 0.2417792082, alpha: 1)
        cell.textLabel?.text = viewModel.competition(namefor: indexPath)
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.accessoryType = .disclosureIndicator

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        var competition = viewModel.competition(for: indexPath)
        coordinator?.viewCompetition(competition: competition)
    }
}

extension CompetitionsVC:CompetitionsVCProtocol{
    func reloadTableView() {
            tableView.reloadData()
    }
    
}
