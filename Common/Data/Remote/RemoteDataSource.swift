//
//  RemoteDataSource.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//


import UIKit
import Alamofire
import SwiftyJSON

protocol RemoteDataSourceProtocol {
    func getAllRestaurant(navigation: UINavigationController, completion: @escaping(Result<RestaurantEntity, Error>) -> Void)
    func getDetailRestaurant(with restaurantId: String, completion: @escaping(Result<DetailRestaurantEntity, APIError>) -> Void)
}


class RemoteDataSource: NSObject {
    static let shared = RemoteDataSource()
    
    override init() {
        
    }
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getDetailRestaurant(with restaurantId: String, completion: @escaping (Result<DetailRestaurantEntity, APIError>) -> Void) {
        let url = Endpoints.Gets.getDetailRestaurant(id: restaurantId).url
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSON(data: data)
                    let detailRestaurantEntity = DetailRestaurantEntity(json: jsonData)
                    completion(.success(detailRestaurantEntity))
                }
                catch {
                    let error = APIError(statusCode: response.response?.statusCode ?? -1, message: response.debugDescription)
                    completion(.failure(error))
                }
            case .failure(let error):
                let error = APIError(statusCode: response.response?.statusCode ?? -1, message: response.debugDescription)
                completion(.failure(error))
            }
        }
    }
    
    func getAllRestaurant(navigation: UINavigationController, completion: @escaping (Result<RestaurantEntity, any Error>) -> Void) {
        let url = Endpoints.Gets.getAllRestaurantList.url
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSON(data: data)
                    let restaurantEntity = RestaurantEntity(json: jsonData)
                    completion(.success(restaurantEntity))
                }
                catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
