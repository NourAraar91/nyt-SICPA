//
//  MainViewRouter.swift
//  NYT App
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit


protocol MainViewRouter {
    func showSearchView()
    func showArticlesListView(with articles: [Article], title: String)
    func loading(show: Bool, completion: (() -> Void)?)
    func showError(error: Error)
}
