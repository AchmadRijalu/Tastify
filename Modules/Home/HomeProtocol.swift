//
//  HomeProtocol.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//

import Foundation
import UIKit


//Presenter
protocol VTPHomeProtocol: AnyObject {
    var view: PTVHomeProtocol? { get set }
    var router: PTRHomeProtocol? { get set }
    var interactor: PTIHomeProtocol? { get set }
    
    func didFetchRestaurantList(navigationController: UINavigationController)
}

//View Renderer
protocol PTVHomeProtocol: AnyObject {
    func onSuccessFetchRestaurantList(restaurantList: RestaurantEntity)
    func onFailureFetchRestaurantList(restaurantList: RestaurantEntity)
}

//Router
protocol PTRHomeProtocol: AnyObject {
    func navigateToDetailRestaurant(restaurant: RestaurantEntity)
}

//Interactor
protocol PTIHomeProtocol: AnyObject {
    var presenter: ITPHomeProtocol? { get set }
    func didFetchRestaunratList(navigationController: UINavigationController)
}


//Callback
protocol ITPHomeProtocol: AnyObject {
    func didFinishFetchRestaurantList(restaurantList: RestaurantEntity)
    func didFailedFetchRestaurantList(error: Error)
}
