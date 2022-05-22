//
//  ArticleTableViewCell.swift
//  NYT App
//
//  Created by Nour Araar on 5/22/22.
//

import UIKit

class ArticleTableViewCellViewModel {
    
    private let artical: Article
    let title: String
    let date: String
    let abstract: String
    let coverURL: String
    
    init (artical: Article) {
        self.artical = artical
        self.title = artical.title ?? ""
        self.date = artical.publishedDate ?? ""
        self.abstract = artical.abstract ?? ""
        self.coverURL = artical.cover ?? ""
    }
}

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var abstractLabel: UILabel!
    @IBOutlet private weak var coverImageView: UIImageView!

    var viewModel: ArticleTableViewCellViewModel? {
        didSet {
            titleLable.text = viewModel?.title
            dateLabel.text = viewModel?.date
            abstractLabel.text = viewModel?.abstract
            coverImageView.load(from: viewModel?.coverURL ?? "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
