//
//  ObservationCollectionLoader.swift
//  Field Survey
//
//  Created by Sam on 11/17/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

class ObservationCollectionLoader {
    
    class func load(jsonFileName: String) -> ObservationEvents? {
        var observationEvents: ObservationEvents?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            observationEvents = try? jsonDecoder.decode(ObservationEvents.self, from: jsonData)
        }
        
        return observationEvents
    }
}
