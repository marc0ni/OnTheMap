//
//  Location.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/28/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import MapKit


// MARK: - Location

struct Location {
    
    // MARK: Properties
    
    let latitude: Double
    let longitude: Double
    let mapstring: String?
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
}
