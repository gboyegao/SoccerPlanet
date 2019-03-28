//
//  File.swift
//  Coordinator
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject,Coordinator{
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func viewCompetition(competition:Competition){
        let vc  = CompetitionDetailVC.instantiate()
        vc.coordinator = self
        vc.competition = competition
        navigationController.pushViewController(vc, animated: true)
    }

    
}
