//
//  MockTodayFixturesVC.swift
//  SoccerPlanetTests
//
//  Created by Adegboyega Olusunmade on 28/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import UIKit
import XCTest

@testable import SoccerPlanet

class MockTodayFixturesVC: TodayFixturesVCProtocol{
    var expectationForCallsAnimateActivity:XCTestExpectation?
    
    func reloadTableView() {
        
    }
    
    func animateActivityIndicator() {
        expectationForCallsAnimateActivity?.fulfill()
    }
    
    func stopAnimatingActivityIndicator() {
        
    }
}
