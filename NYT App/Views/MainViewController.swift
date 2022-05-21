//
//  MainViewController.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit

class MainViewModel {
    var router: MainViewRouter?
    
    func searchCellDidTapped() {
        router?.showSearchView()
    }
    
    func showMostViewdArticlesDidTapped() {
        router?.showArticlesListView()
    }
    
    func showMostSharedArticlesDidTapped() {
        router?.showArticlesListView()
    }
    
    func showMostEmailedArticlesDidTapped() {
        router?.showArticlesListView()
    }
}


class MainViewController: UITableViewController {
    
    var viewModel: MainViewModel?
    
    
    func setViewModel(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
