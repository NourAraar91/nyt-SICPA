//
//  AppCoordinator.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import Foundation
import UIKit


class MainCoordinator: Coordinator {
    
    private let window: UIWindow?
    private let viewController: MainViewController
    private let navigationController: UINavigationController
    
     init(window: UIWindow?,
          navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
         
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         self.viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
         let viewModel = MainViewModel()
         viewModel.router = self
         viewController.setViewModel(viewModel)
    }
    
    
    func start() {
        navigationController.pushViewController(viewController, animated: false)
        window?.rootViewController = navigationController
    }
}


extension MainCoordinator: MainViewRouter {
    
    func showSearchView() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        searchCoordinator.start()
    }
    
    func showArticlesListView() {
        let articlesListCoordinator = ArticlesListCoordinator(navigationController: navigationController)
        articlesListCoordinator.start()
    }
}

