//
//  APISession.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/26/16.
//  Copyright © 2016 udacity. All rights reserved.
//


import Foundation

enum HTTPMethod:String {
    case GET, POST, PUT, DELETE
}

struct APIData {
    let scheme:String
    let host: String
    let path: String
    let domain: String
}


class APISession : NSObject {

    // MARK: Properties
    private let session: NSURLSession
    private let apiData:APIData
    

    // MARK: Initializers
    
    init(apiData:APIData) {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        self.session = NSURLSession(configuration: configuration)
        self.apiData = apiData
    }
    
    
    // Reconstructed from https://github.com/jarrodparkes/ios-on-the-map
    func makeRequestAtURL(url:NSURL, method: HTTPMethod, headers: [String:String]? = nil, body: [String:AnyObject]? = nil, responseHandler: (NSData?, NSError?) -> Void) {
        
        let request = NSMutableURLRequest(URL:url)
        request.HTTPMethod = method.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let body = body {
            request.HTTPBody = try!NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions())
        }
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            if let error = error {
                responseHandler(nil, error)
                return
            }
        
            /* GUARD: Did we get a successful 2XX response? */
            if let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 {
                
                let userInfo = [
                    NSLocalizedDescriptionKey: Errors.UnsuccessfulResponse
                ]
                let error = NSError(domain: Errors.Domain, code: statusCode, userInfo: userInfo)
                responseHandler(nil, error)
                return
            }
        }
        task.resume()
    }
    
    
    // Reconstructed from https://github.com/jarrodparkes/ios-on-the-map
    func urlForMethod(method: String?, withPathExtension: String? = nil, parameters: [String:AnyObject]? = nil) -> NSURL {
        let components = NSURLComponents()
        components.scheme = apiData.scheme
        components.host = apiData.host
        components.path = apiData.path
        
        if let parameters = parameters {
            components.queryItems = [NSURLQueryItem]()
            for (key, value) in parameters {
                let queryItem = NSURLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }
        
        return components.URL!
    }
    
    // Copiedfrom https://github.com/jarrodparkes/ios-on-the-map
    func cookieForName(name: String) -> NSHTTPCookie? {
        let sharedCookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        for cookie in sharedCookieStorage.cookies! {
            if cookie.name == name {
                return cookie
            }
        }
        return nil
    }
    
    
    // Copiedfrom https://github.com/jarrodparkes/ios-on-the-map
    func errorWithStatus(status: Int, description: String) -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: description]
        return NSError(domain: apiData.domain, code: status, userInfo: userInfo)
    }

}
