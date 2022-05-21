//
//  MainViewControllerTests.swift
//  NYT AppTests
//
//  Created by Nour Araar on 5/21/22.
//

import XCTest
@testable import NYT_App

class MainViewControllerTests: XCTestCase {
    
    var sut: MainViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = try XCTUnwrap(storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    
    func test_shouldHaveTableView() {
        XCTAssertTrue(sut.tableView.isDescendant(of: sut.view))
    }
    
    
    func test_tableViewShouldHaveTwoSections() {
        XCTAssertEqual(sut.tableView.numberOfSections, 2)
    }

}
