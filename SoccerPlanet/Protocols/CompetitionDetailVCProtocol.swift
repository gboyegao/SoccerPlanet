//
//  CompetitionDetailVCProtocol.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation

protocol CompetitionDetailVCProtocol:class {
    var competition:Competition? { get }
    func reloadTableView() 
}
