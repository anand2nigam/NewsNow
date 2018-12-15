//
//  NewsDataModel.swift
//  NewsNow
//
//  Created by Anand Nigam on 08/09/18.
//  Copyright © 2018 Anand Nigam. All rights reserved.
//

import Foundation



struct NewsDataModel: Codable {
    let totalResults: Int
    let status: String
    let articles: [Article]
}

struct Article: Codable {
    let title : String
    let content: String?
    let publishedAt: String
    let description: String?
    let url: String
    let author: String?
    let source: Source?
    let urlToImage: String?
}

struct Source: Codable {
    let id : String?
    let name: String
}
