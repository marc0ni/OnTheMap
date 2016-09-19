//
//  APISession.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/26/16.
//  Copyright © 2016 udacity. All rights reserved.
//

// Copiedfrom https://github.com/jarrodparkes/ios-on-the-map
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
    
    private let session:NSURLSession!
    private let apiData:APIData
    
    // MARK: Initializers
    
    init(apiData: APIData) {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        // allow for adjusting of default configuration...
        
        self.session = NSURLSession(configuration: configuration)
        self.apiData = apiData
    }
    
    // MARK: Requests
    /// Generalize the 7-step task process to allow slotting in URLs, methods, headers, bodies, and responseHandlers for particular sharedInstances
    
    func makeRequestAtURL(url:NSURL, method:HTTPMethod, headers:[String:String]? = nil, body:[String:AnyObject]? = nil, responseHandler:(NSData?, NSError?) -> Void) {
        
        /// 1. Parameters set by the sharedInstance
        
        /// 2. Build URL
        let request = NSMutableURLRequest(URL:url)
        request.HTTPMethod = method.rawValue
    
        
        /// 3. Configure request
        // add headers
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
    
        // add body
        if let body = body {
            request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions())
        }
    
        
        /// 4. Make request
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            // was there an error?
            if let error = error {
                responseHandler(nil, error)
                return
            }
            
            // did we get a successful 2XX response?
            if let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode < 200 && statusCode > 299 {
                let userInfo = [
                    NSLocalizedDescriptionKey: Errors.UnsuccessfulResponse
                ]
                let error = NSError(domain: Errors.Domain, code: statusCode, userInfo: userInfo)
                responseHandler(nil, error)
                return
            }
             responseHandler(nil, error)
        }
        
        /// 5,6. Data parsed and used in sharedInstance
        
        ///* 7. Start the request */
        task.resume()
    }
    

    
    // MARK: URLs
    
    func urlForMethod(method: String?, withPathExtension: String? = nil, parameters:[String:AnyObject]? = nil) -> NSURL {
        
        let components = NSURLComponents()
        components.scheme = apiData.scheme
        components.host = apiData.host
        components.path = apiData.path + (method ?? "") + (withPathExtension ?? "")
        
        
        if let parameters = parameters {
            components.queryItems = [NSURLQueryItem]()
            for (key, value) in parameters {
                let queryItem = NSURLQueryItem(name:key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }
        
        return components.URL!
    }
    
    // MARK: Cookies
    
    func cookieForName(name: String) -> NSHTTPCookie? {
        let sharedCookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        for cookie in sharedCookieStorage.cookies! {
            if cookie.name == name {
                return cookie
            }
        }
        return nil
    }

    
    // MARK: Errors
    
    func errorWithStatus(status: Int, description: String) -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: description]
        return NSError(domain: apiData.domain, code: status, userInfo: userInfo)
    }
}