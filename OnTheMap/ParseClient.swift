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
        let apiData = APIData(scheme: Components.Scheme, host: Components.Host, path: Components.Path, domain: Errors.Domain)
        apiSession = APISession(apiData: apiData)
    }
    
    // MARK: Singleton Instance
    
    private static var sharedInstance = ParseClient()
    
    class func sharedClient() -> ParseClient {
        return sharedInstance
    }
    
    // MARK: Make Request
    /// Specifies the URLs, methods, headers, bodies, and responseHandlers for Parse sharedInstances and applies them to the 7-step task process
    private func makeRequestForParse(url url:NSURL, method:HTTPMethod, body:[String:AnyObject]? = nil, responseHandler:(jsonAsDictionary: [String:AnyObject]?, error:NSError?) -> Void) {
        
        /// 1. Set parameters by creating 'headers' array for Parse sharedInstance
        let headers = [
            HeaderKeys.APIKey:HeaderValues.APIKey,
            HeaderKeys.AppId:HeaderValues.AppId,
            HeaderKeys.Accept:HeaderValues.JSON,
            HeaderKeys.ContentType:HeaderValues.JSON
        ]
        
        /// 2. Build the URL  other functions
        
        /// 3. Use 'makeRequestAtURL' function to configure the request, 4. Make the request
        apiSession.makeRequestAtURL(url, method:method, headers:headers, body:body) { (data, error) in
            if let data = data {
                let jsonAsDictionary = try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! [String:AnyObject]
                responseHandler(jsonAsDictionary: jsonAsDictionary, error: nil)
            } else {
                responseHandler(jsonAsDictionary: nil, error: nil)
            }
        }
        
        /// Complete the 7-step process (5. Parse the data, 6. Use the data, 7. Start the request) in other functions
    }
    
    // MARK: GET Student Location
    
    /// Completes 7-step process to generate a "student location with user key"
    func studentLocationWithUserKey(userKey: String, completionHandler: (location: StudentLocation?, error: NSError?) -> Void) {
        
        /// 1/2. Sets parameters and builds specific URL for 'studentLocation'
        let studentLocationURL = apiSession.urlForMethod(Objects.StudentLocation, parameters: [
            ParameterKeys.Where: "{\"\(ParameterKeys.UniqueKey)\":\"" + "\(userKey)" + "\"}"
            ])
        
        /// 3. Build URL for 'studentLocation' in
        
        /// 4. Makes request
        makeRequestForParse(url: studentLocationURL, method: .GET) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                completionHandler(location: nil, error: error)
                return
            }
            
            /// 5. Parses data, 6. Uses the data
            if let jsonAsDictionary = jsonAsDictionary,
                let studentDictionaries = jsonAsDictionary[JSONResponseKeys.Results] as? [[String:AnyObject]] {
                if studentDictionaries.count == 1 {
                    completionHandler(location: StudentLocation(dictionary: studentDictionaries[0]), error: nil)
                    return
                }
            }
            
            /// 7. Starts request
            completionHandler(location: nil, error: self.apiSession.errorWithStatus(0, description: Errors.NoRecordAtKey))
        }
    }
    
    // MARK: GET Student Locations
    
    func studentLocations(completionHandler:(location:StudentLocation?, error:NSError?) -> Void) {
        
        /// 1/2. Sets parameters and builds specific URL for 'studentLocation'
        let studentLocationURL = apiSession.urlForMethod(Objects.StudentLocation, parameters: [
            //Limit, Order
            :])
        
        /// 3. Builds URL for 'studentLocation', 4. Makes request
        makeRequestForParse(url: studentLocationURL, method: .GET) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                completionHandler(location: nil, error: error)
                return
            }
            
            /// 5. Parses data, 6. Uses the data
            if let jsonAsDictionary = jsonAsDictionary,
                let studentDictionaries = jsonAsDictionary[JSONResponseKeys.Results] as? [[String:AnyObject]] {
                if studentDictionaries.count == 1 {
                    completionHandler(location: StudentLocation(dictionary: studentDictionaries[0]), error: nil)
                    return
                }
            }
            
            /// 7. Starts request
            completionHandler(location: nil, error: self.apiSession.errorWithStatus(0, description: Errors.NoRecordAtKey))
        }

    }
    
    // MARK: POST Student Location
    
    func postStudentLocation(mediaURL: String, studentLocation: StudentLocation, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        /// 1. Sets parameters
        let studentLocationBody: [String:AnyObject] = [
            BodyKeys.UniqueKey: studentLocation.student.uniqueKey,
            BodyKeys.FirstName: studentLocation.student.firstName,
            BodyKeys.LastName: studentLocation.student.lastName,
            BodyKeys.MapString: studentLocation.location.mapString!,
            BodyKeys.MediaURL: mediaURL,
            BodyKeys.Latitude: studentLocation.location.latitude,
            BodyKeys.Longitude: studentLocation.location.longitude
        ]
        
        /// 2. Builds specific URL for 'studentLocation'
        let studentLocationURL = apiSession.urlForMethod(Objects.StudentLocation)

        /// 3. Configure request, 4. Make request
        makeRequestForParse(url: studentLocationURL, method: .POST, body: studentLocationBody) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                completionHandler(success: false, error: error)
                return
            }
            
            // success
            /// 5. Parses data, 6. Uses the data
            if let jsonAsDictionary = jsonAsDictionary,
                let _ = jsonAsDictionary[JSONResponseKeys.ObjectID] as? String {
                completionHandler(success: true, error: nil)
                return
            }
            
            // known failure
            if let jsonAsDictionary = jsonAsDictionary,
                let error = jsonAsDictionary[JSONResponseKeys.Error] as? String {
                completionHandler(success: true, error: self.apiSession.errorWithStatus(0, description: error))
                return
            }
            
            // unknown failure
            /// 7. Starts request
            completionHandler(success: false, error: self.apiSession.errorWithStatus(0, description: Errors.CouldNotPostLocation))
        }
    }
    

    // MARK: PUT Student Location
    
    func updateStudentLocationWithObjectID(objectID: String, mediaURL: String, studentLocation: StudentLocation, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        let studentLocationURL = apiSession.urlForMethod(Objects.StudentLocation, withPathExtension: "/\(objectID)")
        let studentLocationBody: [String:AnyObject] = [
            BodyKeys.UniqueKey: studentLocation.student.uniqueKey,
            BodyKeys.FirstName: studentLocation.student.firstName,
            BodyKeys.LastName: studentLocation.student.lastName,
            BodyKeys.MapString: studentLocation.location.mapString!,
            BodyKeys.MediaURL: mediaURL,
            BodyKeys.Latitude: studentLocation.location.latitude,
            BodyKeys.Longitude: studentLocation.location.longitude
        ]
        
        makeRequestForParse(url: studentLocationURL, method: .PUT, body: studentLocationBody) { (jsonAsDictionary, error) in
            
            guard error == nil else {
                completionHandler(success: false, error: error)
                return
            }
            
            // success
            if let jsonAsDictionary = jsonAsDictionary,
                let _ = jsonAsDictionary[JSONResponseKeys.ObjectID] as? String {
                completionHandler(success: true, error: nil)
                return
            }
            
            // known failure
            if let jsonAsDictionary = jsonAsDictionary,
                let error = jsonAsDictionary[JSONResponseKeys.Error] as? String {
                completionHandler(success: true, error: self.apiSession.errorWithStatus(0, description: error))
                return
            }
            
            // unknown failure
            completionHandler(success: false, error: self.apiSession.errorWithStatus(0, description: Errors.CouldNotUpdateLocation))
        }
    }
}

