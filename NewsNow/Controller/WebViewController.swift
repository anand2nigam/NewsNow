//
//  WebViewController.swift
//  NewsNow
//
//  Created by Anand Nigam on 16/12/18.
//  Copyright © 2018 Anand Nigam. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    
    var url: String?
    
    
    @IBOutlet weak var newsWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsWebView.navigationDelegate = self
        
        newsWebView.load(URLRequest(url: URL(string: url!)!))
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
