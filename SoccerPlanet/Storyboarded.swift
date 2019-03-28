//
//  Storyboarded.swift
//  Coordinator
//
//  Created by Adegboyega Olusunmade on 22/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self:UIViewController{
    static func instantiate() -> Self{
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
