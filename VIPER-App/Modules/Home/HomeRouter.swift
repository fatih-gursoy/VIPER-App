//
//  HomeRouter.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 12.10.2022.
//

import UIKit

class HomeRouter: HomeRouterProtocol {

    static func createHomeView() -> HomeVC {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        return view
    }
    
    func toDetailVC(from view: UIViewController, with article: Article) {
        let detailView = DetailRouter.createDetailView(with: article)
        view.navigationController?.pushViewController(detailView, animated: true)
    }
}
