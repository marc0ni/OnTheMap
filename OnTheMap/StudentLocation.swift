//
//  StudentLocation.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/28/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit


// MARK: - StudentLocation

struct StudentLocation {
    
    // MARK: Properties
    
    let objectId: String
    let uniqueKey: String
    let firstName: String
    let lastName: String
    let mediaUrl: String
    let latitude: Double
    let longitude: Double
    let mapstring: String
    
    // MARK: Initializers
    
    init(dictionary: [String:AnyObject]) {
        objectId = dictionary[ParseClient.ResponseKeys.objectId] as! String
        uniqueKey = dictionary[ParseClient.ResponseKeys.uniqueKey] as! String
        firstName = dictionary[ParseClient.ResponseKeys.firstName] as! String
        lastName = dictionary[ParseClient.ResponseKeys.lastName] as! String
        mediaUrl = dictionary[ParseClient.ResponseKeys.mediaUrl] as! String
        latitude = dictionary[ParseClient.ResponseKeys.Latitude] as! Double
        longitude = dictionary[ParseClient.ResponseKeys.Longitude] as! Double
        mapstring = (dictionary[ParseClient.ResponseKeys.Mapstring] as? String)!
    }
    
}
