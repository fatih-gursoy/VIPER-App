//
//  DetailVC.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 13.10.2022.
//

import UIKit

class DetailVC: UIViewController, DetailViewProtocol {

    @IBOutlet private weak var titleLabel: UILabel!
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func showArticles(article: Article) {
        titleLabel.text = article.articleDescription
    }

}
