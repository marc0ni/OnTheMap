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
    
    let mapTextDelegate = MapsTextFieldDelegate()
    
    let mapsTextAttributes = [
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 17)!,
        ]
    
    
    // MARK - Actions
    @IBAction func logInAction(sender: UIButton) {
    }
}