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
        objectId = dictionary[ParseClient.JSONResponseKeys.objectId] as! String
        uniqueKey = dictionary[ParseClient.JSONResponseKeys.uniqueKey] as! String
        firstName = dictionary[ParseClient.JSONResponseKeys.firstName] as! String
        lastName = dictionary[ParseClient.JSONResponseKeys.lastName] as! String
        mediaUrl = dictionary[ParseClient.JSONResponseKeys.mediaUrl] as! String
        latitude = dictionary[ParseClient.JSONResponseKeys.Latitude] as! Double
        longitude = dictionary[ParseClient.JSONResponseKeys.Longitude] as! Double
        mapstring = (dictionary[ParseClient.JSONResponseKeys.Mapstring] as? String)!
    }
    
}
