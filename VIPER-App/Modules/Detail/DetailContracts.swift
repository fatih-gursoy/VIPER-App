//
//  DetailContracts.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 13.10.2022.
//

import Foundation

//MARK: - View

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? {get set}
    func showArticles(article: Article)
}

//MARK: - Presenter

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? {get set}
    var router: DetailRouterProtocol? {get set}
    func viewDidLoad()
}

protocol DetailRouterProtocol {
    
}
