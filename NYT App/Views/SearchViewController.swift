//
//  SearchViewController.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit


class SearchViewModel {
    var router: SearchViewRouter?
    var searchKeyword: String?
    let apiClient = APIClinet()
    
    func searchButtonTapped() {
        guard let searchKeyword = searchKeyword, !searchKeyword.isEmpty else {
            return
        }

        router?.loading(show: true, completion: nil)
        Task.init {
            do {
                let articlesSearch = try await apiClient.searchFor(keyword: searchKeyword)
                let articles = articlesSearch.map { Article(url: $0.webURL,
                                                            title: $0.title,
                                                            publishedDate: $0.pubDate,
                                                            abstract: $0.abstract,
                                                            media: [Media(data: $0.multimedia)])}
                DispatchQueue.main.async {
                    self.router?.showArticlesListView(articles: articles, title: self.searchKeyword ?? "")
                }
            } catch {
                router?.showError(error: error)
            }
        }
    }
}

class SearchViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var searchButton: UIButton!
    
    var viewModel: SearchViewModel?
    
    func setViewModel(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        searchBar.delegate = self
    }
    
    
    @IBAction func searchButtonDidTapped( _ sender: UIButton) {
        view.endEditing(true)
        viewModel?.searchButtonTapped()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchButton.isHidden = searchText.isEmpty
        viewModel?.searchKeyword = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.searchButtonTapped()
        view.endEditing(true)
    }
}
