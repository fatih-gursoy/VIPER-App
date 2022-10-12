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
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchData() {
        
        networkManager.fetchData(endPoint: "") { [weak self] (result: [Article]) in
            guard let self else {return}
            self.presenter?.didFetch(result)
        }
    }
    
    
}
