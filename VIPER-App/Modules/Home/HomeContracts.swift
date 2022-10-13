//
//  Contracts.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 7.10.2022.
//

import UIKit

//MARK: - View

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? {get set}
    func showArticles(articles: [Article])
    func showError(error: String)
}

//MARK: - Presenter

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? {get set}
    var interactor: HomeInteractorProtocol? {get set}
    var router: HomeRouterProtocol? {get set}
    
    func viewDidLoad()
    func didSelect(from view: UIViewController, with article: Article)
}

//MARK: - Interactor

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomeInteractorOutput? {get set}
    func fetchData()
}

protocol HomeInteractorOutput: AnyObject {
    func didFetch(_ articles: [Article])
    func onError()
}

//MARK: - Router

protocol HomeRouterProtocol: AnyObject {
    func toDetailVC(from view: UIViewController, with article: Article)
}
