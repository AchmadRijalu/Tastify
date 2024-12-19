//
//  DetailRestaurantFactory.swift
//  Tastify
//
//  Created by Achmad Rijalu on 18/12/24.
//


import UIKit
import UtilityLibrary


public protocol DetailRestaurantFactoryProtocol {
    func createDetailRestaurant(_ context: DetailRestaurantModuleContext ) -> UIViewController
}


class DetailRestaurantFactory: DetailRestaurantFactoryProtocol {
    func createDetailRestaurant(_ context: DetailRestaurantModuleContext) -> UIViewController {
        let viewController: DetailRestaurantDisplayLogic & UIViewController = DetailHomeView()
        var interactor: DetailRestaurantModuleBusinessLogic = DetailRestaurantModuleInteractor()
        var presenter: DetailRestaurantModulePresenterInput & DetailRestaurantModulePresenterOutput = DetailRestaurantModulePresenter()
        var router: DetailRestaurantModuleRouting = DetailRestaurantModuleRouter()
        
        
        router.baseVC = viewController
        interactor.presenter = presenter
        interactor.context = context
        presenter.interactor = interactor
        presenter.router = router
        presenter.viewController = viewController
        viewController.presenter = presenter
        return viewController
    }
    
    
}

public struct DetailRestaurantModule: UtilityLibrary.Module {
    public init() {
        
    }
    public func register(for injector: Injector) {
        injector.register(DetailRestaurantFactory(), for: DetailRestaurantFactoryProtocol.self)
    }
    
    
}
