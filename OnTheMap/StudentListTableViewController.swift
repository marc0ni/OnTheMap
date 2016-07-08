//
//  StudentListTableViewController.swift
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

class StudentListTableViewController: UITableViewController {
    weak var delegate: PushViewControllerDelegate?
    
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var addPinButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    
    
    //MARK - Actions
    @IBAction func logoutAction(sender: AnyObject) {
    }
   
    
    
    
    
    @IBAction func addPinAction(sender: AnyObject) {
        let listVC = self.storyboard?.instantiateViewControllerWithIdentifier("StudentListTableViewController") as! StudentListTableViewController!
        self.delegate?.pushViewController(listVC)
    }
    
    
    @IBAction func refreshAction(sender: AnyObject) {
    }
   

}