//
//  MainViewController.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit

class MainViewModel {
    var router: MainViewRouter?
    
    func showSearchDidTapped() {
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
    
    // MARK -: IBOutlets
    
    var viewModel: MainViewModel?
    
    
    func setViewModel(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NYT"
    }
    
    
    // MARK -: IBActions
    
    @IBAction func showSearchDidTapped(_ sender: Any) {
        viewModel?.showSearchDidTapped()
    }
    
    
    @IBAction func showMostViewdArticlesDidTapped(_ sender: Any) {
        viewModel?.showMostViewdArticlesDidTapped()
    }
    
    
    @IBAction func showMostSharedArticlesDidTapped(_ sender: Any) {
        viewModel?.showMostSharedArticlesDidTapped()
    }
    
    @IBAction func showMostEmailedArticlesDidTapped(_ sender: Any) {
        viewModel?.showMostEmailedArticlesDidTapped()
    }
}
