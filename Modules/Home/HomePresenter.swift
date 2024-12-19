//
//  HomePresenter.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//
import Foundation
import UIKit

class HomePresenter: VTPHomeProtocol {
    var view: PTVHomeProtocol?
    var router: PTRHomeProtocol?
    var interactor: PTIHomeProtocol?
    var viewController: HomeView!
    
    
    init(){}
    // Initializer with dependency injection
    init(viewController: HomeView) {
        self.viewController = viewController
    }
    
    func didFetchRestaurantList(navigationController: UINavigationController) {
        guard let interactor = interactor else {
            print("Interactor is not assigned.")
            return
        }
        interactor.didFetchRestaunratList(navigationController: navigationController)
    }
}

extension HomePresenter: ITPHomeProtocol {
    func didFailedFetchRestaurantList(error: any Error) {
        // Log the error
        print("Failed to fetch restaurant list: \(error.localizedDescription)")
        // Notify the view
       
    }
    
    func didFinishFetchRestaurantList(restaurantList: RestaurantEntity) {
        if restaurantList.message == "success" {
            view?.onSuccessFetchRestaurantList(restaurantList: restaurantList)
        } else {
            view?.onFailureFetchRestaurantList(restaurantList: restaurantList)
        }
    }
}

