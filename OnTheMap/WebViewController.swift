//
//  WebViewController.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 6/28/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit


class WebViewController: UIViewController {
    
    // MARK: Properties
    
    var urlRequest: NSURLRequest? = nil
    var completionHandlerForView: ((success: Bool, errorString: String?) -> Void)? = nil
    
    // MARK: Outlets
    
    @IBOutlet weak var webView: UIWebView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(cancelAuth))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let urlRequest = urlRequest {
            webView.loadRequest(urlRequest)
        }
    }
    
    // MARK: Cancel Auth Flow
    
    func cancelAuth() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

// MARK: - TMDBAuthViewController: UIWebViewDelegate

extension WebViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        if webView.request!.URL!.absoluteString == "\("https://www.udacity.com/account/auth#!/signup")" {
            
            dismissViewControllerAnimated(true) {
                self.completionHandlerForView!(success: true, errorString: nil)
            }
        }
    }
}