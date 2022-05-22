//
//  MainCoordinatorTests.swift
//  NYT AppTests
//
//  Created by Nour Araar on 5/21/22.
//

import XCTest
@testable import NYT_App

class MainCoordinatorTests: XCTestCase {
    
    var sut: MainCoordinator!
    var navigationControllerMock: NavigationControllerMock!
    var window: UIWindow!

    override func setUpWithError() throws {
        window = UIWindow(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 200,
                                        height: 200))
        navigationControllerMock = NavigationControllerMock()
        sut = MainCoordinator(
            window: window,
            navigationController: navigationControllerMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationControllerMock = nil
        window = nil
    }

    
    func test_start_shouldSetRouter() throws {
        sut.start()
        
        let mainViewController = try XCTUnwrap(
            navigationControllerMock.lastPushedViewController
            as? MainViewController)
        
        let viewModel = try XCTUnwrap(mainViewController.viewModel)
        XCTAssertIdentical(viewModel.router as? MainCoordinator, sut)
    }
    
    
    func test_showSearchViewTap_shouldPushSearchView() throws {
        sut.showSearchView()
        XCTAssertNotNil(navigationControllerMock.lastPushedViewController
                        as? SearchViewController)
    }
    
    
    func test_showMostViewedTap_shouldPushArticlesListView() throws {
        sut.showArticlesListView(with: [], title: "")
        XCTAssertNotNil(navigationControllerMock.lastPushedViewController
                        as? ArticlesListViewController)
    }

}
