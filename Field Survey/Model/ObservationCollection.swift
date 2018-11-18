//
//  ObservationCollection.swift
//  Field Survey
//
//  Created by Sam on 11/17/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

import UIKit

enum Observation: String, Codable {
    case mammal
    case insect
    case bird
    case reptile
    case amphibian
    case plant
    case fish
}

struct ObservationEvent: Codable {
    var classification: Observation
    var title: String
    var description: String
    var date: Date
}

struct ObservationEvents: Codable {
    var status: String
    var events: [ObservationEvent]
}
