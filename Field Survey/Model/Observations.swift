//
//  Observations.swift
//  Field Survey
//
//  Created by Sam on 11/17/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

enum Observation: String{
    case bird
    case amphibian
    case reptile
    case insect
    case fish
    case plant
    case mammal
    
    var image: UIImage?{
        return UIImage(named: self.rawValue + "Icon")
    }
}
