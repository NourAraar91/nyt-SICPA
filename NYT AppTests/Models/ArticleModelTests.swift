//
//  ArticleModelTests.swift
//  NYT AppTests
//
//  Created by Nour Araar on 5/22/22.
//

import XCTest
@testable import NYT_App

class ArticleModelTests: XCTestCase {


    func test_init_whenGivenTitle_setTitle() {
        let article = Article(title: "Article 1")
        XCTAssertEqual(article.title, "Article 1")
    }
    
    
    func test_init_whenGivenDate_setDate() {
        let article = Article(title: "Article 1",
                              publishedDate: "2022-05-22")
        XCTAssertEqual(article.publishedDate, "2022-05-22")
    }

}
