//
//  MainCoordinator.swift
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
    private let activityLoader: ActivityLoader = ActivityLoader()
    
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
        activityLoader.stop {
            searchCoordinator.start()
        }
    }
    
    func showArticlesListView(with articles: [Article], title: String) {
        let articlesListCoordinator = ArticlesListCoordinator(navigationController: navigationController,
                                                              articles: articles,
                                                              title: title)
        activityLoader.stop {
            articlesListCoordinator.start()
        }
    }
    
    func loading(show: Bool, completion: (() -> Void)? = nil) {
        if show {
            activityLoader.show(on: navigationController, completion: completion)
        } else {
            activityLoader.stop(completion: completion)
        }
    }
    
    
    func showError(error: Error) {
        let alertController = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        activityLoader.stop { [weak self] in
            self?.navigationController.present(alertController, animated: true, completion: nil)
        }
    }
}

