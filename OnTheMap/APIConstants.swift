//
//  APIConstants.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/26/16.
//  Copyright © 2016 udacity. All rights reserved.
//

extension APISession {
    
    // MARK: Constants
    struct Constants {
        
        // MARK: API Key
        static let ApiKey : String = "YOUR_API_KEY_HERE"
        
        // MARK: URLs
        static let ApiScheme = "https"
        static let ApiHost = "host"
        static let ApiPath = "path"
        static let ApiQuery : String = "query"
    }
    
    // MARK: Parameter Keys
    struct ParameterKeys {
        static let ApiScheme = "apischeme"
        static let ApiHost = "apihost"
        static let ApiPath = "apipath"
        static let ApiQuery : String = "apiquery"
    }
    
    // MARK: JSON Body Keys
    struct JSONBodyKeys {
        static let MediaType = "media_type"
        static let MediaID = "media_id"
    }
    
}
