//
//  OTMTextFieldDelegate.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 7/22/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import Foundation
import UIKit

class OTMTextFieldDelegate: NSObject, UITextFieldDelegate {
    var textField = UITextField()
    var spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
    //textField.leftViewMode = UITextFieldViewMode.Always
    //textField.leftView = spacerView
    
}
