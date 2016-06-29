//
//  LogInViewController.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/20/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import Foundation
import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
       // MARK - Actions
    @IBAction func logInAction(sender: UIButton) {
    }
    
    @IBAction func signUpAction(sender: UIButton) {
        let webController = WebViewController()
        webController.modalPresentationStyle = .OverCurrentContext
        presentViewController(webController, animated: true, completion: nil)
    }    
}