//
//  ArticlesListViewController.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit

enum Section {
    case main
}

class ArticlesListViewModel {
    
    var router: ArticalListRouter?
    let articles: [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
    
    func selectArtical(at index: Int) {
        let artical = articles[index]
        router?.openURL(artical.url ?? "")
    }
}

class ArticlesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource:
    UITableViewDiffableDataSource<Section, Article>?
    
    
    private var viewModel: ArticlesListViewModel?
    
    func setViewModel(_ viewModel: ArticlesListViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        update(with: viewModel?.articles ?? [])
    }
    
    private func setupTableView() {
        dataSource =
        UITableViewDiffableDataSource<Section, Article>(
            tableView: tableView,
            cellProvider: { tableView, indexPath, item in
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
                let viewModel = ArticleTableViewCellViewModel(artical: item)
                cell.viewModel = viewModel
                return cell
            })
        
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        
        tableView.delegate = self
    }
    
    
    private func update(with articles: [Article]) {
      var snapshot =
      NSDiffableDataSourceSnapshot<Section, Article>()
      snapshot.appendSections([.main])
      snapshot.appendItems( articles,
                            toSection: .main)
      dataSource?.apply(snapshot)
    }
    
}

extension ArticlesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectArtical(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
