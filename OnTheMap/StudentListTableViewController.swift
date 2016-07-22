//
//  StudentListTableViewController.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/21/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit
import MapKit



class StudentListTableViewController: UITableViewController {
    
    
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var addPinButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    var student: Student!
    var students: [Student]! {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).students
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StudentLocationTableViewCell", forIndexPath: indexPath) as! StudentLocationTableViewCell
        
        let student = students[indexPath.row] as Student
        
        // Configure the cell...
        cell.fullNameLabel.text = student.fullName
        cell.urlLabel.text = student.mediaUrl
        
        return cell
    }
    
    
    //MARK - Actions
    @IBAction func logoutAction(sender: AnyObject) {
    }
    
    @IBAction func addPinAction(sender: AnyObject) {
       
        let infoVC:InformationPostingViewController = self.storyboard!.instantiateViewControllerWithIdentifier("InformationPostingViewController") as! InformationPostingViewController
        presentViewController(infoVC, animated: true, completion: nil)
    }
    
    @IBAction func refreshAction(sender: AnyObject) {
    }
   

}