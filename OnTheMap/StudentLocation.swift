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
        objectId = dictionary[ParseClient.JSONResponseKeys.ObjectID] as? String ?? ""
        
        // student data
        let uniqueKey = dictionary[ParseClient.JSONResponseKeys.UniqueKey] as? String ?? ParseClient.DefaultValues.ObjectID
        let firstName = dictionary[ParseClient.JSONResponseKeys.FirstName] as? String ?? ParseClient.DefaultValues.FirstName
        let lastName = dictionary[ParseClient.JSONResponseKeys.LastName] as? String ?? ParseClient.DefaultValues.LastName
        let mediaUrl = dictionary[ParseClient.JSONResponseKeys.MediaURL] as? String ?? ParseClient.DefaultValues.MediaURL
        student = Student(uniqueKey: uniqueKey, firstName: firstName, lastName: lastName, mediaUrl: mediaUrl)
        
        // location data
        let latitude = dictionary[ParseClient.JSONResponseKeys.Latitude] as? Double ?? 0.0
        let longitude = dictionary[ParseClient.JSONResponseKeys.Longitude] as? Double ?? 0.0
        let mapString = dictionary[ParseClient.JSONResponseKeys.MapString] as? String ?? ParseClient.DefaultValues.MapString
        location = Location(latitude: latitude, longitude: longitude, mapString: mapString)
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
    
    // MARK: Convenience "Initializers"
    
    static func locationsFromDictionaries(dictionaries: [[String:AnyObject]]) -> [StudentLocation] {
        var studentLocations = [StudentLocation]()
        for studentDictionary in dictionaries {
            studentLocations.append(StudentLocation(dictionary: studentDictionary))
        }
        return studentLocations
    }


}
