//
//  DetailRestaurantModulePresenter.swift
//  Tastify
//
//  Created by ___FULLNAME___ on 18/12/24.
//

import Foundation

protocol DetailRestaurantModulePresenterInput {
    var viewController: DetailRestaurantDisplayLogic? { get set }
    var interactor: DetailRestaurantModuleBusinessLogic! { get set }
    var router: DetailRestaurantModuleRouting? { get set }
    
    func viewDidLoad()
}


protocol DetailRestaurantModulePresenterOutput: AnyObject {
    func presentDetailRestaurant(_ restaurantEntity: DetailRestaurantEntity)
    func presentError(_ statusCode: Int)
    func presentGeneralError()
}

class DetailRestaurantModulePresenter {
    weak var viewController: DetailRestaurantDisplayLogic?
    var interactor: DetailRestaurantModuleBusinessLogic!
    var router: DetailRestaurantModuleRouting?
}

extension DetailRestaurantModulePresenter: DetailRestaurantModulePresenterInput {
    func viewDidLoad() {
        guard let restaurantId = interactor.context?.restaurantId else {return}
        interactor.getDetailRestaurant(with: restaurantId)
    }
}

extension DetailRestaurantModulePresenter: DetailRestaurantModulePresenterOutput {
    func presentDetailRestaurant(_ restaurantEntity: DetailRestaurantEntity) {
        DispatchQueue.main.async {
            self.viewController?.displayDetailRestaurant(name: restaurantEntity.restaurant.name, description: restaurantEntity.restaurant.description, city: restaurantEntity.restaurant.city, address: restaurantEntity.restaurant.address, pictureId: restaurantEntity.restaurant.pictureId, categories: restaurantEntity.restaurant.categories, foods: restaurantEntity.restaurant.menus.foods, drinks: restaurantEntity.restaurant.menus.drinks)
        }
    }
    
//    func presentUsers(_ users: [User]) {
//        let underageUsers = users.filter { $0.age < 21 }
//        let usernames: [String] = underageUsers.map { $0.name }
//        let joinedUserNames = usernames.joined(separator: "\n")
//        DispatchQueue.main.async { [weak self] in
//            self?.viewController?.displayUser(joinedUserNames)
//        }
//    }

    
    
    func presentError(_ statusCode: Int) {
//        switch statusCode {
//        case 404:
//            router?.showNotFound()
//        case 500:
//            router?.showServerError()
//        }
    }
    
    func presentGeneralError() {
        
    }
}
