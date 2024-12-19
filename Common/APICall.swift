//
//  APICALL.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//


struct APICall {
    static let baseUrl = "https://restaurant-api.dicoding.dev"
}

protocol Endpoint {
    var url: String { get }
}


enum Endpoints {
    enum Gets: Endpoint {
        case getAllRestaurantList
        case getDetailRestaurant(id: String)
        
        var url: String {
            switch self {
            case .getAllRestaurantList:
                return "\(APICall.baseUrl)/list"
            case .getDetailRestaurant(let id):
                return "\(APICall.baseUrl)/detail/:\(id)"
            }
        }
        
        
    }
}
