//
//  APIClinet.swift
//  NYT App
//
//  Created by Nour Araar on 5/22/22.
//

import Foundation

protocol URLSessionProtocol {
  func data(for request: URLRequest,
            delegate: URLSessionTaskDelegate?)
  async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}


class APIClinet {
    
    lazy var session: URLSessionProtocol = URLSession.shared
    
    func fetchMostViewedArticles() async throws -> [Article] {
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=\(Secrets.appKey)")
        else { return [] }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await session.data(for: request, delegate: nil)
        let articlesResponse = try JSONDecoder().decode(ArticlesResponse.self, from: data)
        return articlesResponse.results
    }
    
    func fetchMostSharedArticles() async throws -> [Article] {
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/shared/1.json?api-key=\(Secrets.appKey)")
        else { return [] }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await session.data(for: request, delegate: nil)
        let articlesResponse = try JSONDecoder().decode(ArticlesResponse.self, from: data)
        return articlesResponse.results
    }

    func fetchMostEmailedArticles() async throws -> [Article] {

        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=\(Secrets.appKey)")
        else { return [] }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await session.data(for: request, delegate: nil)
        let articlesResponse = try JSONDecoder().decode(ArticlesResponse.self, from: data)
        return articlesResponse.results
    }

    func searchFor(keyword: String) async throws -> [ArticleSearch] {
        guard let url = URL(string: "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(keyword)&api-key=\(Secrets.appKey)")
        else { return [] }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await session.data(for: request, delegate: nil)
        let articlesResponse = try JSONDecoder().decode(ArticlesSearchResponse.self, from: data)
        return articlesResponse.response.docs
    }
}
