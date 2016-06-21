//
//  AnnotationViewController.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/21/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import Foundation
import UIKit

class AnnotationViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var findMapButton: UIBarButtonItem!
    
    
    @IBAction func cancelAction(sender: AnyObject) {
    }
    
    @IBAction func findMapAction(sender: UIBarButtonItem) {
    }
    
}