//
//  TodayFixturesVCProtocol.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation

protocol TodayFixturesVCProtocol:class {
    func reloadTableView()
    func animateActivityIndicator()
    func stopAnimatingActivityIndicator()
}
