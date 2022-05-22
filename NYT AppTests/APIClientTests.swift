//
//  APIClientTests.swift
//  NYT AppTests
//
//  Created by Nour Araar on 5/22/22.
//

import XCTest
@testable import NYT_App

class APIClientTests: XCTestCase {
    
    var sut: APIClinet!
    
    override func setUpWithError() throws {
        sut = APIClinet()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_mostViewedArticles_shouldFetchesArticles() async throws {
        let url = try XCTUnwrap(URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=\(Secrets.appKey)"))
        let urlSessionMock = URLSessionProtocolMock()
        let expected = ArticlesResponse(results: [Article(title: "dummy title")])
        urlSessionMock.dataForDelegateReturnValue = (
            try JSONEncoder().encode(expected),
            HTTPURLResponse(url: url,
                            statusCode: 200,
                            httpVersion: "HTTP/1.1",
                            headerFields: nil)!
        )
        sut.session = urlSessionMock
        
        let items = try await sut.fetchMostViewedArticles()
        
        XCTAssertEqual(items, expected.results)
        XCTAssertEqual(urlSessionMock.dataForDelegateRequest,
                       URLRequest(url: url))
    }
    
    
    func test_mostViewedArticles_whenError_shouldPassError() async throws {
        let urlSessionMock = URLSessionProtocolMock()
        let expected = NSError(domain: "", code: 1234, userInfo: nil)
        urlSessionMock.dataForDelegateError = expected
        sut.session = urlSessionMock
        
        do {
            _ = try await sut.fetchMostViewedArticles()
            XCTFail()
        } catch {
            let nsError = try XCTUnwrap(error as NSError)
            XCTAssertEqual(nsError, expected)
        }
    }
    
    
    func test_mostViewedArticles_whenJSONIsWrong_shouldPassError() async throws {
        let url = try XCTUnwrap(URL(string: "foo"))
        let urlSessionMock = URLSessionProtocolMock()
        urlSessionMock.dataForDelegateReturnValue = (
            try JSONEncoder().encode("dummy"),
            HTTPURLResponse(url: url,
                            statusCode: 200,
                            httpVersion: "HTTP/1.1",
                            headerFields: nil)!
        )
        sut.session = urlSessionMock
        
        do {
            _ = try await sut.fetchMostViewedArticles()
            XCTFail()
        } catch {
            XCTAssertTrue(error is Swift.DecodingError)
        }
    }
    
    
    func test_mostEmailedArticles_shouldFetchesArticles() async throws {
        let url = try XCTUnwrap(URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=\(Secrets.appKey)"))
        let urlSessionMock = URLSessionProtocolMock()
        let expected = ArticlesResponse(results: [Article(title: "dummy title")])
        urlSessionMock.dataForDelegateReturnValue = (
            try JSONEncoder().encode(expected),
            HTTPURLResponse(url: url,
                            statusCode: 200,
                            httpVersion: "HTTP/1.1",
                            headerFields: nil)!
        )
        sut.session = urlSessionMock
        
        let items = try await sut.fetchMostEmailedArticles()
        XCTAssertEqual(items, expected.results)
        XCTAssertEqual(urlSessionMock.dataForDelegateRequest,
                       URLRequest(url: url))
    }
    
    
    func test_mostSharedArticles_shouldFetchesArticles() async throws {
        let url = try XCTUnwrap(URL(string: "https://api.nytimes.com/svc/mostpopular/v2/shared/1.json?api-key=\(Secrets.appKey)"))
        let urlSessionMock = URLSessionProtocolMock()
        let expected = ArticlesResponse(results: [Article(title: "dummy title")])
        urlSessionMock.dataForDelegateReturnValue = (
            try JSONEncoder().encode(expected),
            HTTPURLResponse(url: url,
                            statusCode: 200,
                            httpVersion: "HTTP/1.1",
                            headerFields: nil)!
        )
        sut.session = urlSessionMock
        
        let items = try await sut.fetchMostSharedArticles()
        
        XCTAssertEqual(items, expected.results)
        XCTAssertEqual(urlSessionMock.dataForDelegateRequest,
                       URLRequest(url: url))
    }
    
    
    func test_searchArticles_shouldFetchesArticles() async throws {
        let url = try XCTUnwrap(URL(string: "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=cats&api-key=\(Secrets.appKey)"))
        let urlSessionMock = URLSessionProtocolMock()
        let expected = ArticlesSearchResponse(response: Response(docs: [ArticleSearch(id: "1",
                                                                                      abstract: "abstract",
                                                                                      webURL: "url",
                                                                                      snippet: "snippet",
                                                                                      leadParagraph: "leadParagraph",
                                                                                      source: "source",
                                                                                      multimedia: [],
                                                                                      pubDate: "",
                                                                                      headline:
                                                                                        Headline(main: "")
                                                                                     )
                                                                       ]))
        urlSessionMock.dataForDelegateReturnValue = (
            try JSONEncoder().encode(expected),
            HTTPURLResponse(url: url,
                            statusCode: 200,
                            httpVersion: "HTTP/1.1",
                            headerFields: nil)!
        )
        sut.session = urlSessionMock
        
        let items = try await sut.searchFor(keyword: "cats")
        
        XCTAssertEqual(items, expected.response.docs)
        XCTAssertEqual(urlSessionMock.dataForDelegateRequest,
                       URLRequest(url: url))
    }
    
}
