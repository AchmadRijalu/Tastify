//
//  DetailRestaurantModuleRouter.swift
//  Tastify
//
//  Created by ___FULLNAME___ on 18/12/24.
//

import Foundation
import UIKit
import UtilityLibrary

protocol DetailRestaurantModuleRouting: Routing {
    var baseVC: UIViewController? { get set }
    
//    func routeToUserDetail(selectedUser: String)
    
    func routeToDetailRestauant(selectedRestaurant: String)
}

class DetailRestaurantModuleRouter: DetailRestaurantModuleRouting {
    
    weak var baseVC: UIViewController?
    @Inject var restaurantFactory: DetailRestaurantFactoryProtocol
    func routeToDetailRestauant(selectedRestaurant: String) {
        let destVC = restaurantFactory.createDetailRestaurant(.init(restaurantId: selectedRestaurant))
//        let restaurantDetail = UIViewController()
        try? route(.push(animated: true), for: destVC)
    }
    

    
//    func routeToUserDetail(selectedUser: String) {
//        let destVC = userFactory.createModuleUserDetailVC(.init(selectedUser: selectedUser))
//        let destVC = UIViewController()
//        destVC.view.backgroundColor = .red
//        try? route(.present(animated: true), for: destVC)
//    }
    
    
    // TODO: move to the ModuleFactory
    /*
     static func createDetailRestaurantModuleViewController(_ context: DetailRestaurantModuleContext? = nil) -> UIViewController {
         let viewController: DetailRestaurantModuleDisplayLogic & UIViewController = DetailRestaurantModuleViewController()
         var interactor: DetailRestaurantModuleBusinessLogic = DetailRestaurantModuleInteractor()
         var presenter: DetailRestaurantModulePresenterInput & DetailRestaurantModulePresenterOutput = DetailRestaurantModulePresenter()
         var router: DetailRestaurantModuleRouting = DetailRestaurantModuleRouter()
         
         router.baseVC = viewController
         viewController.presenter = presenter
         presenter.viewController = viewController
         presenter.interactor = interactor
         presenter.router = router
         interactor.presenter = presenter
         interactor.context = context
         
         return viewController
     }
     */
}
