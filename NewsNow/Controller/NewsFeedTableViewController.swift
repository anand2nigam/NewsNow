//
//  NewsFeedTableViewController.swift
//  NewsNow
//
//  Created by Anand Nigam on 07/09/18.
//  Copyright © 2018 Anand Nigam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsFeedTableViewController: UITableViewController {
    
    let newsURL = "https://newsapi.org/v2/top-headlines"
    let appID = "fde86b813a4448889e2f93196a307820"

    override func viewDidLoad() {
        super.viewDidLoad()

        let parametersForQuery: [String:String] = ["country" : "us" , "apiKey" : appID]
        
        getNewsData(url: newsURL, parameters: parametersForQuery)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TableView DataSource Methods


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    // MARK:- Networking
    
    func getNewsData(url: String, parameters: [String:String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                print("Success, got the news data")
                
                let newsJSON: JSON = JSON(response.result.value!)
                
                print(newsJSON)
                
                
            } else {
                print("Error \( response.result.error )")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
}
