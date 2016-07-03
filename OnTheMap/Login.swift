//
//  Login.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 7/3/16.
//  Copyright © 2016 udacity. All rights reserved.
//

struct Login {
    // MARK: Properties
    let username: String
    let password: String
    
    
    // construct a login from a dictionary
    init(dictionary: [String:AnyObject]) {
        username = dictionary[UdacityClient.JSONResponseKeys.username] as! String
        password = dictionary[UdacityClient.JSONResponseKeys.password] as! String
    }
}
