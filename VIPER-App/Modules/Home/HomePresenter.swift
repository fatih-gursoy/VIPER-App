//
//  HomePresenter.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 12.10.2022.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func didSelect(_ article: Article) {
        router?.toDetailVC()
    }
     
}

extension HomePresenter: HomeInteractorOutput {
    
    func didFetch(_ articles: [Article]) {
            view?.showArticles(articles: articles)
    }
    
    func onError() {
        view?.showError(error: "Error")
    }
    
}
