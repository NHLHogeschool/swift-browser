//
//  ViewController.swift
//  Browser
//
//  Created by Dirk Sierd de Vries on 18-09-14.
//  Copyright (c) 2014 Dirk Sierd de Vries. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var webView: UIWebView!

    @IBAction func goForward(sender: AnyObject) {
        webView.goForward()
    }
    @IBAction func goBack(sender: AnyObject) {
        webView.goBack()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        urlTextField.resignFirstResponder()
        var url = urlTextField.text

        if !url.hasPrefix("http") {
            url = "http://\(url)"
        }

        let req = NSURLRequest(URL: NSURL.URLWithString(url))
        webView.loadRequest(req)

        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}