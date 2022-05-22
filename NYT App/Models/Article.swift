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

// MARK: - Article
struct Article: Codable, Equatable, Hashable {
    let url: String?
    let source, publishedDate, nytdsection, byline: String?
    let title, abstract: String?
    let media: [Media]?
    
    var cover: String? {
        return media?.first?.data?[1].url
    }

    enum CodingKeys: String, CodingKey {
        case url, source
        case publishedDate = "published_date"
        case nytdsection, byline, title, abstract, media
    }
}

// MARK: - Media
struct Media: Codable, Equatable, Hashable {
    let data: [MediaData]?

    enum CodingKeys: String, CodingKey {
        case data = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaData: Codable, Equatable, Hashable {
    let url: String?
}
