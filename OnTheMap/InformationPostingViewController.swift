//
//  InformationPostingViewController.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/21/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class InformationPostingViewController: UIViewController, MKMapViewDelegate , UITextFieldDelegate {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var linkField: UITextField!
    @IBOutlet weak var postingMap: MKMapView!
   
    
    @IBOutlet weak var findMapButton: UIButton!
    @IBOutlet weak var selectMapButton: UIButton!
    
    
    
    @IBAction func cancelAction(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion:nil)
    }
    
    
    // MARK - Actions
    
    @IBAction func findMapAction(sender: AnyObject) {
    }
    
    @IBAction func selectMapAction(sender: AnyObject) {
    }
}