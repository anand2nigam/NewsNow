//
//  NewsFeedTableViewController.swift
//  NewsNow
//
//  Created by Anand Nigam on 07/09/18.
//  Copyright © 2018 Anand Nigam. All rights reserved.
//

import UIKit
import SafariServices





class NewsFeedTableViewController: UITableViewController {
    
    let newsURL = "https://newsapi.org/v2/top-headlines"
    let appID = "fde86b813a4448889e2f93196a307820"
    
    var dataModel: [Article] = []

    
   
    override func viewDidLoad() {
        super.viewDidLoad()

         
        

        
        fetchJSON()
        

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
        print(dataModel[indexPath.row].url)
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        
        let safariViewController = SFSafariViewController(url: URL(string: dataModel[indexPath.row].url)!)
        
        present(safariViewController, animated: true, completion: nil)
       
        
    }

   
    // MARK:- Networking and JSON Parsing ( using Codable )
    
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
