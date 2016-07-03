//
//  UdacityConstants.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/22/16.
//  Copyright © 2016 udacity. All rights reserved.
//

extension UdacityClient {
    
        // MARK: Constants
        struct Constants {
            
            // MARK: Components
            static let UdacityScheme = "https"
            static let UdacityHost = "www.udacity.com"
            static let UdacityPath = "/api/session"
            static let UdacityQuery = "query"
        }
    
    // MARK: Methods
    struct Methods {
        static let postASession = "https://www.udacity.com/api/session"
        static let deleteASession = "https://www.udacity.com/api/session"
    }
    
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        static let username:String = "username"
        static let password:String = "password"
    }
    
        // MARK: Properties
    struct Properties {
        // MARK: Properties
        let username: String
        let password: String
    
        // construct a login from a dictionary
        init(dictionary: [String:AnyObject]) {
            username = dictionary[UdacityClient.JSONResponseKeys.username] as! String
            password = dictionary[UdacityClient.JSONResponseKeys.password] as! String
        }
    }
}