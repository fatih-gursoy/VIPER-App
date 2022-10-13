//
//  DetailRouter.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 13.10.2022.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    
    static func createDetailView(with article: Article) -> DetailVC {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        let presenter = DetailPresenter()
        let router = DetailRouter()
        presenter.view = view
        presenter.article = article
        presenter.router = router
        view.presenter = presenter
        return view
    }
}
