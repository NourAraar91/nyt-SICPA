//
//  Article.swift
//  NYT App
//
//  Created by Nour Araar on 5/22/22.
//

import Foundation



// MARK: - ArticlesResponse
struct ArticlesResponse: Codable {

    let results: [Article]

    enum CodingKeys: String, CodingKey {
        case results
    }

}

// MARK: - Result
struct Article: Codable, Equatable {
    let publishedDate: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case publishedDate = "published_date"
        case title
    }
    
    init(title: String, publishedDate: String? = nil) {
        self.title = title
        self.publishedDate = publishedDate
    }
}
