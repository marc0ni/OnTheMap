//
//  UdacityConstants.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/22/16.
//  Copyright © 2016 udacity. All rights reserved.
//

extension UdacityClient {
    
    // Copied from https://github.com/jarrodparkes/ios-on-the-map
    struct Common {
        static let SignUpURL = "https://www.udacity.com/account/auth#!/signup"
    }
    
    // Copied from https://github.com/jarrodparkes/ios-on-the-map
    struct Errors {
        static let Domain = "UdacityClient"
        static let UnableToLogin = "Unable to login."
        static let UnableToLogout = "Unable to logout."
        static let NoUserData = "Cannot access user data."
        
    }
    
    // Constructed based on ParseClient example
    struct Components {
        static let Scheme = "https"
        static let Host = "www.udacity.com"
        static let Path = "/api"
    }
    
    // Copied from https://github.com/jarrodparkes/ios-on-the-map
    struct Methods {
        static let Session = "/session"
        static let Users = "/users"
    }
    
    struct Cookies {
        static let XSRFToken = "X-XSRF-TOKEN"
    }
    
    // Constructed based on ParseClient example
    struct HeaderKeys {
        static let Accept = "Accept"
        static let ContentType = "Content-Type"
        static let XSRFToken = "X-XSRF-TOKEN"
    }
    
    // Constructed based on ParseClient example
    struct HeaderValues {
        static let JSON = "application/json"
    }
    
     // Constructed based on ParseClient example
    struct HTTPBodyKeys {
        static let Udacity = "udacity"
        static let Username = "username"
        static let Password = "password"
    }
    
    // Copied from https://github.com/jarrodparkes/ios-on-the-map
    struct JSONResponseKeys {
        static let Account = "account"
        static let UserKey = "key"
        static let Status = "status"
        static let Session = "session"
        static let Error = "error"
        static let User = "user"
        static let FirstName = "first_name"
        static let LastName = "last_name"
        
    }
    
}