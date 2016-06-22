//
//  ListViewController.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/21/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit
import MapKit

protocol PushViewControllerDelegate: class {
    func pushViewController(vc: UIViewController)
}

class ListViewController: UITableViewController {
    weak var delegate: PushViewControllerDelegate?
    
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var addPinButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
   
    //MARK - Actions
    @IBAction func logoutAction(sender: AnyObject) {
    }
    
    @IBAction func addPinAction(sender: AnyObject) {
        let annotationVC = self.storyboard?.instantiateViewControllerWithIdentifier("AnnotationViewController") as! AnnotationViewController!
        self.delegate?.pushViewController(annotationVC)
    }
    
    
    @IBAction func refreshAction(sender: AnyObject) {
    }
   

}