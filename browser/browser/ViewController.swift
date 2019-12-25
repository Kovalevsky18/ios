//
//  ViewController.swift
//  browser
//
//  Created by Родион Ковалевский on 12/24/19.
//  Copyright © 2019 Родион Ковалевский. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var textField: UITextField!
    var url = URL(string: "https://google.com")
    override func viewDidLoad() {
        super.viewDidLoad()
      var  request = URLRequest(url: url!)
        webView.loadRequest(request)
        print("Hello,World")
    }

    
    @IBAction func search(_ sender: UIButton) {
        url = URL(string: textField.text!)
        var  request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
}

