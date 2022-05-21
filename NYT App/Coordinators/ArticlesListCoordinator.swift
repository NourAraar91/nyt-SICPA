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
    
     init(navigationController: UINavigationController) {
        self.navigationController = navigationController
         
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         self.viewController = storyboard.instantiateViewController(withIdentifier: "ArticlesListViewController")
    }
    

    func start() {
        navigationController.pushViewController(viewController, animated: false)
    }
    
}

