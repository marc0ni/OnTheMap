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
    func pushViewController(vc: InformationPostingViewController)
}

class StudentListTableViewController: UITableViewController {
    weak var delegate: PushViewControllerDelegate?
    
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
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailController:DetailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        detailController.meme = memes[indexPath.row] as Meme
        navigationController!.pushViewController(detailController, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueFromTable") {
            tabBarController!.tabBar.hidden = true
        }
    }*/


    
    
    
    //MARK - Actions
    @IBAction func logoutAction(sender: AnyObject) {
    }
    
    @IBAction func addPinAction(sender: AnyObject) {
        let infoVC = self.storyboard?.instantiateViewControllerWithIdentifier("InformationPostingViewController") as! InformationPostingViewController!
        self.delegate!.pushViewController(infoVC)
    }
    
    @IBAction func refreshAction(sender: AnyObject) {
    }
   

}