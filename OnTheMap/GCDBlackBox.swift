//
//  GCDBlackBox.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/19/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(updates: () -> Void) {
    dispatch_async(dispatch_get_main_queue()) {
        updates()
    }
}
