//
//  Student.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 7/7/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit


struct Student {
    
    // Properties
    let uniqueKey: String
    let firstName: String
    let lastName: String
    var mediaUrl: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    // Initializers
    init (uniqueKey: String) {
        self.uniqueKey = uniqueKey
        firstName = ""
        lastName = ""
        mediaUrl = ""
    }
    
    init(uniqueKey: String, firstName:String, lastName:String, mediaUrl:String){
        self.uniqueKey = uniqueKey
        self.firstName = firstName
        self.lastName = lastName
        self.mediaUrl = mediaUrl
    }
    
}