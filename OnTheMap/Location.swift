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
        latitude = dictionary[ParseClient.JSONResponseKeys.Latitude] as! Double
        longitude = dictionary[ParseClient.JSONResponseKeys.Longitude] as! Double
        mapstring = dictionary[ParseClient.JSONResponseKeys.Mapstring] as? String
    }
    
}
