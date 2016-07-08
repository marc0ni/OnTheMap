//
//  ParseConstants.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/27/16.
//  Copyright © 2016 udacity. All rights reserved.
//

extension ParseClient {
    
    // MARK: ParseConstants
    struct ParseConstants {
        
        // MARK: Components
        static let ParseScheme = "https"
        static let ParseHost = "api.parse.com"
        static let ParsePath = "/1/classes/StudentLocation"
        static let ParseQuery : String = "/query"
    }
    
    // MARK: Methods
    struct Methods {
        static let getStudentLocations = "https://api.parse.com/1/classes/StudentLocation"
        static let getStudentLocation = "https://api.parse.com/1/classes/StudentLocation?where="
        static let postStudentLocaton = "https://api.parse.com/1/classes/StudentLocation"
        static let putStudentLocations = "/<objectId>"
    }
    
    // MARK: Parameter Keys
    struct ParameterKeys {
        static let ApplicationKey = "app_key"
        static let ApiKey = "api_key"
    }
    
    // MARK: Default Values
    struct DefaultValues {
        static let ObjectID = "[No Object ID]"
        static let UniqueKey = "[No Unique Key]"
        static let FirstName = "[No First Name]"
        static let LastName = "[No Last Name]"
        static let MediaURL = "[No Media URL]"
        static let MapString = "[No Map String]"
    }
    
    // MARK: Parameter Values
    struct ParameterValues {
        static let ApplicationKey: String = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        static let ApiKey : String = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
    }
    
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        static let limit = 100
        static let objectId = "objectId"
        static let uniqueKey = "UdacityClient.ParameterValues.username"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let mapString = "mapString"
        static let mediaUrl = "mediaUrl"
        static let Longitude = "longitude"
        static let Latitude = "latitude"
        static let CreatedAt = "createdAt"
        static let UpdatedAt = "updatedAt"
        
    }
}