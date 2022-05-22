//
//  SearchViewRouter.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import Foundation

protocol SearchViewRouter {
    func showArticlesListView(articles: [Article], title: String)
    func loading(show: Bool, completion: (() -> Void)?)
    func showError(error: Error)
}
