//
//  AppSetupTests.swift
//  NYT AppTests
//
//  Created by Nour Araar on 5/21/22.
//

import XCTest
@testable import NYT_App

class AppSetupTests: XCTestCase {
    
    func test_application_shouldSetupRoot() throws {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let root = scene?.windows.first?.rootViewController
        
        let nav = try XCTUnwrap(root as? UINavigationController)
        XCTAssert(nav.topViewController is MainViewController)
    }

}
