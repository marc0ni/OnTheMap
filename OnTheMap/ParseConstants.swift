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
        
        // MARK: API Key
        static let ApplicationKey: String = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        static let ApiKey : String = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
        
        // MARK: URLs
        static let ApiScheme = "https"
        static let ApiHost = "?"
        static let ApiPath = "?"
        static let AuthorizationURL : String = "?"
    }
    
    // MARK: Methods
    /*struct Methods {
        
        // MARK: Account
        static let Account = "/account"
        
        // MARK: Authentication
        static let AuthenticationTokenNew = "?"
        static let AuthenticationSessionNew = "?"
        
        // MARK: Config
        static let Config = "/configuration"
        
    }
    
    // MARK: URL Keys
    struct URLKeys {
        static let UserID = "id"
    }*/
    
    // MARK: Parameter Keys
    struct ParameterKeys {
        static let ApplicationKey = "app_key"
        static let ApiKey = "api_key"
        /*static let SessionID = "session_id"
        static let RequestToken = "request_token"
        static let Query = "query"*/
    }
    
    // MARK: Response Keys
    struct ResponseKeys {
        static let objectId = "objectId"
        static let uniqueKey = "uniqueKey"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let mediaUrl = "mediaUrl"
        static let Longitude = "longitude"
        static let Latitude = "latitude"
        static let Mapstring = "mapstring"
        static let ID = "id"
        static let PosterPath = "poster_path"
        static let StatusCode = "status_code"
        static let StatusMessage = "status_message"
        static let SessionID = "session_id"
        static let RequestToken = "request_token"
        static let Success = "success"
        static let UserID = "id"
        static let Results = "results"
    }

    
    // MARK: JSON Body Keys
    struct JSONBodyKeys {
        static let MediaType = "media_type"
        static let MediaID = "media_id"
    }
    
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        
        // MARK: General
        static let StatusMessage = "status_message"
        static let StatusCode = "status_code"
        
        // MARK: Authorization
        static let RequestToken = "request_token"
        static let SessionID = "session_id"
        
        // MARK: Account
        static let UserID = "id"
        
        // MARK: Location
        static let Latitude = "latitude"
        static let Longitude = "longitude"
        static let MapString = "mapstring"
        
    }
}