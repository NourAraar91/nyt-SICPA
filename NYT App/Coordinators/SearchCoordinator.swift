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
    
     init(navigationController: UINavigationController) {
        self.navigationController = navigationController
         
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         self.viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
         
         let viewModel = SearchViewModel()
         viewModel.router = self
         self.viewController.setViewModel(viewModel)
    }
    

    func start() {
        navigationController.pushViewController(viewController, animated: false)
    }
    
    
}


extension SearchCoordinator: SearchViewRouter {
    
    func showArticlesListView() {
        let articlesListCoordinator = ArticlesListCoordinator(navigationController: navigationController)
        articlesListCoordinator.start()
    }
}
