//
//  ArticlesListCoordinator.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit


class ArticlesListCoordinator: Coordinator {
    private let viewController: UIViewController
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController,
         title: String) {
        self.navigationController = navigationController
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewController = storyboard.instantiateViewController(withIdentifier: "ArticlesListViewController")
        self.viewController.title = title
    }
    

    func start() {
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

