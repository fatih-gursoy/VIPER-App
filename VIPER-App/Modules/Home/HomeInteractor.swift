//
//  HomeInteractor.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 12.10.2022.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    
    private var networkManager: NetworkProtocol
    weak var presenter: HomeInteractorOutput?
    
    init(networkManager: NetworkProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchData() {
        
        let api = "https://newsapi.org/v2/top-headlines?country=tr&apiKey=9fd690aefd6f4cc389f4307bd4070151"
        
        networkManager.fetchData(endPoint: api) { [weak self] (result: Result) in
            guard let self else {return}
            self.presenter?.didFetch(result.articles)
        }
    }
    
    
}
