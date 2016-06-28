//
//  Location.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/28/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit


// MARK: - Location

struct Location {
    
    // MARK: Properties
    
    let latitude: Double
    let longitude: Double
    let mapstring: String?
    
    // MARK: Initializers
    
    init(dictionary: [String:AnyObject]) {
        latitude = dictionary[ParseClient.ResponseKeys.Latitude] as! Double
        longitude = dictionary[ParseClient.ResponseKeys.Longitude] as! Double
        mapstring = dictionary[ParseClient.ResponseKeys.Mapstring] as? String
    }
    
}
