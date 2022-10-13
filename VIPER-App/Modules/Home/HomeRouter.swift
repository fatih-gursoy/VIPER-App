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
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        
        interactor.presenter = presenter
        return view
    }
    
    func toDetailVC() {
        
        
    }
}
