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
    
    private let udacityClient = UdacityClient.sharedClient()
    
    
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
    @IBAction func logInAction(sender: AnyObject) {
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
            udacityClient.loginWithUsername(emailTextField.text!, password: passwordTextField.text!) { (userKey, error) in
                dispatch_async(dispatch_get_main_queue()) {
                    if let userKey = userKey {
                        self.getStudentWithUserKey(userKey)
                    } else {
                        self.alertWithError(error!.localizedDescription)
                    }
                }
            }
        }
    }
    
    
    @IBAction func signUpAction(sender: UIButton) {
        let webController = WebViewController()
        webController.modalPresentationStyle = .OverCurrentContext
        presentViewController(webController, animated: true, completion: nil)
    }
    
    
    private func getStudentWithUserKey(userKey: String) {
        udacityClient.studentWithUserKey(userKey) { (student, error) in
            dispatch_async(dispatch_get_main_queue()) {
            if let student = student {
                self.DataSource.currentStudent = student
                self.login()
            } else {
                self.rejectWithError(error!.localizedDescription)
            }
        }
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

