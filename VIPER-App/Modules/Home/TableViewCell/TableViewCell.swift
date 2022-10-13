//
//  TableViewCell.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 13.10.2022.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    static let identifier = String(describing: TableViewCell.self)
    
    @IBOutlet private weak var articleImage: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    func configure(_ article: Article) {
        label.text = article.title
        guard let imageURL = article.urlToImage else {return}
        articleImage.kf.setImage(with: URL(string: imageURL))
    }
    
}
