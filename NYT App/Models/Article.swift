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
        
    var url: String?
    var title: String?
    var publishedDate: String?
    var abstract: String?
    var media: [Media]?
    
    var cover: String? {
        if let url = media?.first?.data?.first?.url {
            if url.starts(with: "http") {
                return url
            } else {
                return "https://static01.nyt.com/" + url
            }
        }
        return nil
    }

    enum CodingKeys: String, CodingKey {
        case url
        case publishedDate = "published_date"
        case title, abstract, media
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



// MARK -: Search Response
struct ArticlesSearchResponse: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let docs: [ArticleSearch]
}

// MARK: - Doc
struct ArticleSearch: Codable, Equatable, Hashable {
        
    var id: String?
    var abstract: String?
    let webURL: String?
    let snippet, leadParagraph, source: String?
    let multimedia: [MediaData]?
    let pubDate: String?
    let headline: Headline
    
    var title: String? {
        return headline.main
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case abstract
        case webURL = "web_url"
        case snippet
        case leadParagraph = "lead_paragraph"
        case source, multimedia, headline
        case pubDate = "pub_date"
    }
    
    static func == (lhs: ArticleSearch, rhs: ArticleSearch) -> Bool {
       return lhs.id == rhs.id
    }
}


// MARK: - Headline
struct Headline: Codable, Hashable{
    let main: String?
}
