//
//  SearchCoordinatorTests.swift
//  NYT AppTests
//
//  Created by Nour Araar on 5/21/22.
//

import XCTest
@testable import NYT_App

class SearchCoordinatorTests: XCTestCase {
    
    var sut: SearchCoordinator!
    var navigationControllerMock: NavigationControllerMock!

    override func setUpWithError() throws {

        navigationControllerMock = NavigationControllerMock()
        sut = SearchCoordinator(navigationController: navigationControllerMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationControllerMock = nil
    }

    
    func test_start_shouldSetRouter() throws {
        sut.start()
        
        let searchViewController = try XCTUnwrap(
            navigationControllerMock.lastPushedViewController
            as? SearchViewController)
        
        let viewModel = try XCTUnwrap(searchViewController.viewModel)
        XCTAssertIdentical(viewModel.router as? SearchCoordinator, sut)
    }
    
    
    func test_searchButtonTapped_shouldPushArticlesListView() throws {
        sut.showArticlesListView()
        XCTAssertNotNil(navigationControllerMock.lastPushedViewController
                        as? ArticlesListViewController)
    }

}
