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
    /// Specifies the URLs, methods, headers, bodies, and responseHandlers for Udacity sharedInstances and applies them to the 7-step task process
    private func makeRequestForUdacity(url url: NSURL, method: HTTPMethod, body: [String:AnyObject]? = nil, headers: [String:String]? = nil, responseHandler: (jsonAsDictionary: [String:AnyObject]?, error: NSError?) -> Void) {
        
        /// 1. Set parameters by creating 'allHeaders' array for Parse sharedInstance
        var allHeaders = [
            HeaderKeys.Accept: HeaderValues.JSON,
            HeaderKeys.ContentType: HeaderValues.JSON
        ]
        
        
        if let headers = headers {
            for (key, value) in headers {
                allHeaders[key] = value
            }
        }
        
        /// 2. Build the URL in other functions
        
        /// 3. Use 'makeRequestAtURL' function to configure the request, 4. Make the request
        apiSession.makeRequestAtURL(url, method: method, headers: allHeaders, body: body) { (data, error) in
            if let data = data {
                let jsonAsDictionary = try! NSJSONSerialization.JSONObjectWithData(data.subdataWithRange(NSMakeRange(5, data.length - 5)), options: .AllowFragments) as! [String:AnyObject]
                responseHandler(jsonAsDictionary: jsonAsDictionary, error: nil)
            } else {
                responseHandler(jsonAsDictionary: nil, error: error)
            }
        }
         /// Complete the 7-step process (5. Parse the data, 6. Use the data, 7. Start the request) in other functions
    }
    
    // MARK: Login
    
    func loginWithUsername(username: String, password: String, facebookToken: String? = nil, completionHandler: (userKey: String?, error: NSError?) -> Void) {
        
        let loginURL = apiSession.urlForMethod(Methods.Session)
        var loginBody = [String:AnyObject]()
        loginBody[HTTPBodyKeys.Udacity] = [
            HTTPBodyKeys.Username: username,
            HTTPBodyKeys.Password: password
        ]
    
        makeRequestForUdacity(url: loginURL, method: .POST, body: loginBody) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                completionHandler(userKey: nil, error: error)
                return
            }
            
            if let jsonAsDictionary = jsonAsDictionary {
                // known error case
                if let status = jsonAsDictionary[JSONResponseKeys.Status] as? Int,
                    let error = jsonAsDictionary[JSONResponseKeys.Error] as? String {
                    completionHandler(userKey: nil, error: self.apiSession.errorWithStatus(status, description: error))
                    return
                }
                
                // success case
                if let account = jsonAsDictionary[JSONResponseKeys.Account] as? [String:AnyObject],
                    let key = account[JSONResponseKeys.UserKey] as? String {
                    completionHandler(userKey: key, error: nil)
                    return
                }
            }
            
            // catch-all error case
            completionHandler(userKey: nil, error: self.apiSession.errorWithStatus(0, description: Errors.UnableToLogin))
        }
    }
    
    func loginWithFacebookToken(token: String, completionHandler: (userKey: String?, error: NSError?) -> Void) {
        
        loginWithUsername("", password:  "", facebookToken: token, completionHandler: completionHandler)
    }
    
    // MARK: Logout
    
    func logout(completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        let logoutURL = apiSession.urlForMethod(Methods.Session)
        var logoutHeaders = [String:String]()
        if let xsrfCookie = apiSession.cookieForName(Cookies.XSRFToken) {
            logoutHeaders[HeaderKeys.XSRFToken] = xsrfCookie.value
        }
        
        makeRequestForUdacity(url: logoutURL, method: .DELETE, headers: logoutHeaders) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                completionHandler(success: false, error: error)
                return
            }
            
            // success
            if let jsonAsDictionary = jsonAsDictionary,
                let _ = jsonAsDictionary[JSONResponseKeys.Session] as? [String:AnyObject] {
                completionHandler(success: true, error: nil)
                return
            }
            
            // catch-all error
            completionHandler(success: false, error: self.apiSession.errorWithStatus(0, description: Errors.UnableToLogout))
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
                let userDictionary = jsonAsDictionary[JSONResponseKeys.User] as? [String:AnyObject],
                let firstName = userDictionary[JSONResponseKeys.FirstName] as? String,
                let lastName = userDictionary[JSONResponseKeys.LastName] as? String {
                completionHandler(student: Student(uniqueKey: userKey, firstName: firstName, lastName: lastName, mediaUrl: ""), error: nil)
                return
            }
            
            // catch-all error
            completionHandler(student: nil, error: self.apiSession.errorWithStatus(0, description: Errors.NoUserData))
        }
    }
}