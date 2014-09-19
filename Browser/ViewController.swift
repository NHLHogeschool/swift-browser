//
//  ViewController.swift
//  Browser
//
//  Created by Dirk Sierd de Vries on 18-09-14.
//  Copyright (c) 2014 Dirk Sierd de Vries. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBAction func goTo(sender: AnyObject) {
        urlTextField.resignFirstResponder()
        var url = urlTextField.text

        let regex = NSRegularExpression(pattern:"^https?://",
            options:nil,
            error:nil)

        let match = regex.numberOfMatchesInString(url,
            options:nil,
            range:NSRange(location:0,
                          length:countElements(url)))

        if match < 1 {
            url = "http://\(url)"
        }
    
        let req = NSURLRequest(URL: NSURL.URLWithString(url))
        webView.loadRequest(req)
    }
    @IBAction func goForward(sender: AnyObject) {
        webView.goForward()
    }
    @IBAction func goBack(sender: AnyObject) {
        webView.goBack()
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

