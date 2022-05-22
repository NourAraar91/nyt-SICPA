//
//  ArticlesListCoordinator.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit


class ArticlesListCoordinator: Coordinator {
    private let viewController: ArticlesListViewController
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController,
         articles: [Article],
         title: String) {
        self.navigationController = navigationController
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewController = storyboard.instantiateViewController(withIdentifier: "ArticlesListViewController") as! ArticlesListViewController
        let viewModel = ArticlesListViewModel(articles: articles)
        self.viewController.setViewModel(viewModel)
        viewModel.router = self
        self.viewController.title = title
    }
    

    func start() {
        navigationController.pushViewController(viewController, animated: true)
    }
    
}


extension ArticlesListCoordinator: ArticalListRouter {
    func openURL(_ url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}
