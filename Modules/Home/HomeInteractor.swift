//
//  HomeInteractor.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//

import Foundation
import UIKit


class HomeInteractor: PTIHomeProtocol {
    var presenter: ITPHomeProtocol?
    
    func didFetchRestaunratList(navigationController: UINavigationController) {
        RemoteDataSource.shared.getAllRestaurant(navigation: navigationController) { result in
            switch result {
            case .success(let response):
                // Notify presenter of success
                self.presenter?.didFinishFetchRestaurantList(restaurantList: response)
            case .failure(let error):
                // Notify presenter of failure
                self.presenter?.didFailedFetchRestaurantList(error: error)
            }
        }
    }
}

