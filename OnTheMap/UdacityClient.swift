//
//  UdacityClient.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/22/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import Foundation

// MARK: - UdacityClient

class UdacityClient {
    
    // MARK: Properties
    
    let apiSession: APISession
    
    // MARK: Initializer
    
    init() {
        let apiData = APIData(scheme: Components.Scheme, host: Components.Host, path: Components.Path, domain: Errors.Domain)
        apiSession = APISession(apiData: apiData)
    }
    
    // MARK: Singleton Instance
    
    private static var sharedInstance = UdacityClient()
    
    class func sharedClient() -> UdacityClient {
        return sharedInstance
    }
    
    // MARK: Make Request
    
    private func makeRequestForUdacity(url url: NSURL, method: HTTPMethod, body: [String:AnyObject]? = nil, headers: [String:String]? = nil, responseHandler: (jsonAsDictionary: [String:AnyObject]?, error: NSError?) -> Void) {
        
        var allHeaders = [
            HeaderKeys.Accept: HeaderValues.JSON,
            HeaderKeys.ContentType: HeaderValues.JSON
        ]
        if let headers = headers {
            for (key, value) in headers {
                allHeaders[key] = value
            }
        }
        
        apiSession.makeRequestAtURL(url, method: method, headers: allHeaders, body: body) { (data, error) in
            if let data = data {
                
            } else {
                
            }
        }
    }
    
    // MARK: Login
    
    func loginWithUsername(username: String, password: String, facebookToken: String? = nil, completionHandler: (userKey: String?, error: NSError?) -> Void) {
        
        let loginURL =
        var loginBody =
        if let facebookToken =
            ]
        } else {
    
            ]
        }
        
        makeRequestForUdacity(url: loginURL, method: .POST, body: loginBody) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                
                return
            }
            
            if let jsonAsDictionary = jsonAsDictionary {
                // known error case
    
                    return
                }
                
                // success
                if let jsonAsDictionary = jsonAsDictionary,
                
                return
            }
            
            // catch-all error
        }
    }
    
    /*func loginWithFacebookToken(token: String, completionHandler: (userKey: String?, error: NSError?) -> Void) {
        
        loginWithUsername("", password:  "", facebookToken: token, completionHandler: completionHandler)
    }*/
    
    // MARK: Logout
    
    func logout(completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        let logoutURL =
        var logoutHeaders = [String:String]()
        if let xsrfCookie =  {
        
        }
        
        makeRequestForUdacity(url: logoutURL, method: .DELETE, headers: logoutHeaders) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                completionHandler(success: false, error: error)
                return
            }
            
            // success
            if let jsonAsDictionary = jsonAsDictionary,
            
            return
        }
        
        // catch-all error
        }
    }
    
    // MARK: GET Student Data
    
    func studentWithUserKey(userKey: String, completionHandler: (student: Student?, error: NSError?) -> Void) {
        
        let usersURL = apiSession.urlForMethod(Methods.Users, withPathExtension: "/\(userKey)")
        
        makeRequestForUdacity(url: usersURL, method: .GET) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                completionHandler(student: nil, error: error)
                return
            }
            
            // success
            if let jsonAsDictionary = jsonAsDictionary,
            
                return
            }
            
            // catch-all error
        
        }
}
