//
//  ActivityLoader.swift
//  NYT App
//
//  Created by Nour Araar on 5/22/22.
//

import UIKit


class ActivityLoader {
    
    private var isLoading: Bool = false
    
    private lazy var loader: UIAlertController = {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        return alert
    }()

    func show(on viewController: UIViewController,
              completion: (() -> Void)? = nil) {
        if isLoading { return }
        isLoading = true
        viewController.present(loader, animated: true, completion: completion)
    }
    
    
    func stop(completion: (() -> Void)? = nil) {
        if !isLoading {
            completion?()
            return
        }
        DispatchQueue.main.async { [weak self] in
            self?.loader.dismiss(animated: true, completion: completion)
            self?.isLoading = false
        }
    }
}
