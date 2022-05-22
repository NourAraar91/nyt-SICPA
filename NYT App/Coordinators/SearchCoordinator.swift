//
//  SearchCoordinator.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit


class SearchCoordinator: Coordinator {

    private let viewController: SearchViewController
    private let navigationController: UINavigationController
    private let activityLoader: ActivityLoader = ActivityLoader()
    
     init(navigationController: UINavigationController) {
        self.navigationController = navigationController
         
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         self.viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
         
         let viewModel = SearchViewModel()
         viewModel.router = self
         self.viewController.setViewModel(viewModel)
    }
    

    func start() {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}


extension SearchCoordinator: SearchViewRouter {
    
    func showArticlesListView(articles: [Article], title: String) {
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
