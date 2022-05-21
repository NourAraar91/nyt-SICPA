//
//  SearchViewController.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit


class SearchViewModel {
    var router: SearchViewRouter?
    
    func searchButtonTapped() {
        router?.showArticlesListView()
    }
}

class SearchViewController: UIViewController {
    
    
    var viewModel: SearchViewModel?
    
    func setViewModel(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
