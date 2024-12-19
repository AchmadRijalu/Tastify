//
//  DetailRestaurantModuleInteractor.swift
//  Tastify
//
//  Created by ___FULLNAME___ on 18/12/24.
//

import Foundation
import UtilityLibrary

public struct DetailRestaurantModuleContext {
    var restaurantId: String?
}

protocol DetailRestaurantModuleBusinessLogic {
    var presenter: DetailRestaurantModulePresenterOutput? { get set }
    var context: DetailRestaurantModuleContext? { get set }
    func getDetailRestaurant(with restraurantId: String)
}

class DetailRestaurantModuleInteractor: DetailRestaurantModuleBusinessLogic {
    
    
    weak var presenter: DetailRestaurantModulePresenterOutput?
    var context: DetailRestaurantModuleContext?
    
    //    func getUsers() {
    //        print("data from previous screen", context)
    //        userAPI.getUsers { [weak self] result in
    //            guard let self else { return }
    //            switch result {
    //            case .success(let users):
    //                presenter?.presentUsers(users)
    //            case .failure(let error):
    //                switch error {
    //                case .serverError(let statusCode):
    //                    presenter?.presentError(statusCode)
    //                default:
    //                    presenter?.presentGeneralError()
    //                }
    //            }
    //        }
    //    }
    
    func getDetailRestaurant(with restraurantId: String) {
        RemoteDataSource.shared.getDetailRestaurant(with: restraurantId) { response in
            switch response {
            case .success(let data):
                self.presenter?.presentDetailRestaurant(data)
            case .failure(let error):
                let error = error.statusCode
                self.presenter?.presentError(error)
            }
        }
    }
}
