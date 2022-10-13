//
//  DetailPresenter.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 13.10.2022.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var router: DetailRouterProtocol?
    var article: Article?
    
    func viewDidLoad() {
        guard let article else {return}
        view?.showArticles(article: article)
    }
}
