//
//  coordinator.swift
//  Coordinator
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator{
    var navigationController:UINavigationController{ get set }
    var childCoordinators:[Coordinator] { get set }
}

