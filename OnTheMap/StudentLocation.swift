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
    let student: Student
    let location: Location
    
    // MARK: Initializers
    
    init(dictionary: [String:AnyObject]) {
        objectId = dictionary[ParseClient.JSONResponseKeys.objectId] as? String ?? ""
        
        // student data
        let uniqueKey = dictionary[ParseClient.JSONResponseKeys.uniqueKey] as? String ?? ParseClient.DefaultValues.ObjectID
        let firstName = dictionary[ParseClient.JSONResponseKeys.firstName] as? String ?? ParseClient.DefaultValues.FirstName
        let lastName = dictionary[ParseClient.JSONResponseKeys.lastName] as? String ?? ParseClient.DefaultValues.LastName
        let mediaUrl = dictionary[ParseClient.JSONResponseKeys.mediaUrl] as? String ?? ParseClient.DefaultValues.MediaURL
        student = Student(uniqueKey: uniqueKey, firstName: firstName, lastName: lastName, mediaUrl: mediaUrl)
        
        // location data
        let latitude = dictionary[ParseClient.JSONResponseKeys.Latitude] as? Double ?? 0.0
        let longitude = dictionary[ParseClient.JSONResponseKeys.Longitude] as? Double ?? 0.0
        let mapString = dictionary[ParseClient.JSONResponseKeys.mapString] as? String ?? ParseClient.DefaultValues.MapString
        location = Location(latitude: latitude, longitude: longitude, mapstring: mapString)
    }
    
    init(student: Student, location: Location) {
        objectId = ""
        self.student = student
        self.location = location
    }
    
    init(objectId: String, student: Student, location: Location) {
        self.objectId = objectId
        self.student = student
        self.location = location
    }

}
