//
//  LogInViewController.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/20/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class LogInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    // MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    // MARK - Actions
    @IBAction func logInAction(sender: UIButton) {
        let username = emailTextField.text
        let password = passwordTextField.text
    
        if username!.isEmpty || password!.isEmpty {
            // create the login alert
            let alert = UIAlertController(title: "Invalid", message: "Log in requires username and password", preferredStyle: UIAlertControllerStyle.Alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            completeLogin()
        }
    }
    
    /*private func completeLogin() {
        let request = NSMutableURLRequest(URL: NSURL(string:"https://www.udacity.com/api/session")!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField:"Accept")
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        request.HTTPBody = "{\"udacity\":{\"username\":\"account@domain.com\", \"password\": \"********\"}}".dataUsingEncoding(NSUTF8StringEncoding)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request){data, response, error in
            if error != nil {
                //Handle error...
                return
            }
            
            let newData = data?.subdataWithRange(NSMakeRange(5, data.length -5)) /* subset response data! */
        }
        task.resume()
    
        
        performSegueWithIdentifier("TabBarSegue", sender: "loginButton")
    }*/


    
    @IBAction func signUpAction(sender: UIButton) {
        let webController = WebViewController()
        webController.modalPresentationStyle = .OverCurrentContext
        presentViewController(webController, animated: true, completion: nil)
    }
}



// MARK: - Spacer for TextFields

public extension UITextField {
    @IBInspectable public var leftSpacer:CGFloat {
        get {
            if let l = leftView {
                return l.frame.size.width
            } else {
                return 0
            }
        } set {
            leftViewMode = .Always
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.size.height))
        }
    }
}

