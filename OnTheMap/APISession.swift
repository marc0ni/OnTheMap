//
//  APISession.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/26/16.
//  Copyright © 2016 udacity. All rights reserved.
//


import Foundation

// MARK: - HTTPMethod Enum

enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}

// MARK: - APIData

struct APIData {
    let scheme: String
    let host: String
    let path: String
    let domain: String
}

// MARK: - APISession

class APISession {
    
    // MARK: Properties
    
   
    
    // MARK: Initializers
    
    init(apiData: APIData) {
        // set configuration
        // allow for adjusting of default configuration...
        
    }
    
    // MARK: Requests
    
    func makeRequestAtURL() -> Void) {
        
        // create request and set HTTP method
    
        
        // add headers
    
        
        // add body
    
        
        // create/return task
    
            // was there an error?
    
            
            // did we get a successful 2XX response?
    
    }
    
    // MARK: URLs
    
    func urlForMethod() -> NSURL {
        
        
        
        if let parameters = parameters {
                        }
        }
        
    
    }
    
    // MARK: Cookies
    
    func cookieForName(name: String) -> NSHTTPCookie? {
        
    }
    
    // MARK: Errors
    
    func errorWithStatus(status: Int, description: String) -> NSError {
        
    }
}