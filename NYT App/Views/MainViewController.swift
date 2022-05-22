//
//  MainViewController.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit

class MainViewModel {
    var router: MainViewRouter?
    let apiClient: APIClinet
    
    init(apiClient: APIClinet = APIClinet()) {
        self.apiClient = apiClient
    }
    
    func showSearchDidTapped() {
        router?.showSearchView()
    }
    
    func showMostViewdArticlesDidTapped()  {
        router?.loading(show: true, completion: nil)
        Task.init {
            do {
                let articles = try await apiClient.fetchMostViewedArticles()
                DispatchQueue.main.async {
                    self.router?.showArticlesListView(with: articles, title: "Most Viewed")
                }
            } catch {
                router?.showError(error: error)
            }
        }
    }
    
    func showMostSharedArticlesDidTapped() {
        router?.loading(show: true, completion: nil)
        Task.init {
            do {
                let articles = try await apiClient.fetchMostSharedArticles()
                DispatchQueue.main.async {
                    self.router?.showArticlesListView(with: articles,  title: "Most Shared")
                }
            } catch {
                router?.showError(error: error)
            }
        }
    }
    
    func showMostEmailedArticlesDidTapped() {
        router?.loading(show: true, completion: nil)
        Task.init {
            do {
                let articles = try await apiClient.fetchMostEmailedArticles()
                DispatchQueue.main.async {
                    self.router?.showArticlesListView(with: articles,  title: "Most Emailed")
                }
            } catch {
                router?.showError(error: error)
            }
        }
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
