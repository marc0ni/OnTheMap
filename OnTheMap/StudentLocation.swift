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
        
    }
    
    init(student: Student, location: Location) {
        
    }
    
    init(objectId: String, student: Student, location: Location) {
        
    }
    
    // MARK: Convenience "Initializers"
    
    static func locationsFromDictionaries(dictionaries: [[String:AnyObject]]) -> [StudentLocation] {
        
        return studentLocations
    }


}
