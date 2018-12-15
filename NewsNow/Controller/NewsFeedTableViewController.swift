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



//struct NewsDataModelResonse: Codable {
//    let totalResults: Int
//    let status: String
//    let articles: [Article]
//}
//
//struct Article: Codable {
//    let title : String
//    let content: String?
//    let publishedAt: String
//    let description: String?
//    let url: String
//    let author: String?
//    let source: Source?
//    let urlToImage: String?
//}
//
//struct Source: Codable {
//    let id : String?
//    let name: String
//}

class NewsFeedTableViewController: UITableViewController {
    
    let newsURL = "https://newsapi.org/v2/top-headlines"
    let appID = "fde86b813a4448889e2f93196a307820"
    
    var dataModel: [Article] = []

   
    override func viewDidLoad() {
        super.viewDidLoad()

         
        
      //  getNewsData(url: newsURL, parameters: parametersForQuery)
        
        fetchJSON()
        
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
        return dataModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsItem", for: indexPath)
        
        cell.textLabel?.text = dataModel[indexPath.row].title
        
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }

    
    // MARK:- Networking
//
//    func getNewsData(url: String, parameters: [String:String])  {
//
//        var newsJSON: JSON? = nil
//        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (response) in
//            if response.result.isSuccess {
//                print("Success, got the news data")
//
//                 newsJSON = JSON(response.result.value!)
//
//                self.updateNewsData(json: newsJSON!)
//                print(newsJSON!)
//
//
//
//
//
//            } else {
//                print("Error \( response.result.error )")
//
//            }
//        }
//
//    }
//
//    func updateNewsData(json: JSON) {
//
//        let decoder = JSONDecoder()
//        let model = try decoder.decode(NewsDataModelResponse, from: json)
//
//
//    }
//
   
    
    func fetchJSON() {
     
        var components = URLComponents(string: newsURL)
        
        let queryItemCountry = URLQueryItem(name: "country", value: "us")
        let queryItemKey = URLQueryItem(name: "apiKey", value: appID)
        
        components?.queryItems = [ queryItemKey, queryItemCountry]
        
        guard let url = components?.url! else { return }
        print(url)
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
                guard let data = data else { return}
                
                do {
                    let decoder = JSONDecoder()
                    let apiResponse =  try decoder.decode(NewsDataModel.self, from: data)
                
                    self.dataModel = apiResponse.articles
                    
                    print(apiResponse.status)
                    print(apiResponse.totalResults)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                    
                    
                } catch {
                    print(error)
                }
            
        }.resume()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
}
