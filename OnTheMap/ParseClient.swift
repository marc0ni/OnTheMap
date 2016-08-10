//
//  ParseClient.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/27/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import Foundation

// MARK: - ParseClient

class ParseClient {
    
    // MARK: Properties
    
    let apiSession: APISession
    
    // MARK: Initializer
    
    init() {
        
    }
    
    // MARK: Singleton Instance
    
    private static var sharedInstance = ParseClient()
    
    class func sharedClient() -> ParseClient {
        return sharedInstance
    }
    
    // MARK: Make Request
    
    private func makeRequestForParse() -> Void) {
        
        let headers = [
    
        ]
        
        apiSession.makeRequestAtURL() { (data, error) in
            if let data = data {
    
            } else {
    
            }
        }
    }
    
    // MARK: GET Student Location
    
    func studentLocationWithUserKey() -> Void) {
        
        let studentLocationURL = apiSession.urlForMethod(Objects.StudentLocation, parameters: [
            ParameterKeys.Where: "{\"\(ParameterKeys.UniqueKey)\":\"" + "\(userKey)" + "\"}"
            ])
        
        makeRequestForParse(url: studentLocationURL, method: .GET) { (jsonAsDictionary, error) in
            
            guard error == nil else {
    
            }
            
            if let jsonAsDictionary = jsonAsDictionary,
                let studentDictionaries = jsonAsDictionary[JSONResponseKeys.Results] as? [[String:AnyObject]] {
    
                }
            }
            
            completionHandler(location: nil, error: self.apiSession.errorWithStatus(0, description: Errors.NoRecordAtKey))
        }
    }
    
    // MARK: GET Student Locations
    
    func studentLocations() -> Void) {
        
        let studentLocationURL = apiSession.urlForMethod(Objects.StudentLocation, parameters: [
            
            ])
        
        makeRequestForParse(url: studentLocationURL, method: .GET) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                
            }
            
            if let jsonAsDictionary = jsonAsDictionary,
                let studentDictionaries = jsonAsDictionary[JSONResponseKeys.Results] as? [[String:AnyObject]] {
                completionHandler(locations: StudentLocation.locationsFromDictionaries(studentDictionaries), error: nil)
                return
            }
            
            completionHandler(locations: nil, error: self.apiSession.errorWithStatus(0, description: Errors.NoRecords))
        }
    }
    
    // MARK: POST Student Location
    
    func postStudentLocation(mediaURL: String, studentLocation: StudentLocation, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        let studentLocationURL = apiSession.urlForMethod(Objects.StudentLocation)
        let studentLocationBody: [String:AnyObject] = [
            
        ]
        
        makeRequestForParse(url: studentLocationURL, method: .POST, body: studentLocationBody) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                
                return
            }
            
            // success
            if let jsonAsDictionary = jsonAsDictionary,
            
                return
            }
            
            // known failure
            if let jsonAsDictionary = jsonAsDictionary,
                let error = jsonAsDictionary[JSONResponseKeys.Error] as? String {
                
                return
            }
            
            // unknown failure
            completionHandler(success: false, error: self.apiSession.errorWithStatus(0, description: Errors.CouldNotPostLocation))
        }
    }
    
    // MARK: PUT Student Location
    
    func updateStudentLocationWithObjectID(objectID: String, mediaURL: String, studentLocation: StudentLocation, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        let studentLocationURL = apiSession.urlForMethod(Objects.StudentLocation, withPathExtension: "/\(objectID)")
        let studentLocationBody: [String:AnyObject] = [
                    ]
        
        makeRequestForParse(url: studentLocationURL, method: .PUT, body: studentLocationBody) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                return
            }
            
            // success
            if let jsonAsDictionary = jsonAsDictionary,
                let _ = jsonAsDictionary[JSONResponseKeys.UpdatedAt] {
                
                return
            }
            
            // known failure
            if let jsonAsDictionary = jsonAsDictionary,
                let error = jsonAsDictionary[JSONResponseKeys.Error] as? String {
                return
            }
            
            // unknown failure
            completionHandler(success: false, error: self.apiSession.errorWithStatus(0, description: Errors.CouldNotUpdateLocation))
        }
    }
}