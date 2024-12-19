//
//  HomeEntity.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//



import SwiftyJSON

struct RestaurantEntity {
    let error: Bool
    let message: String
    let count: Int
    let restaurants: [Restaurant]
    
    init(json: JSON) {
        self.error = json["error"].boolValue
        self.message = json["message"].stringValue
        self.count = json["count"].intValue
        self.restaurants = json["restaurants"].arrayValue.map { Restaurant(json: $0) }
    }
}

struct Restaurant {
    let id: String
    let name: String
    let description: String
    let pictureId: String
    let city: String
    let rating: Double
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.description = json["description"].stringValue
        self.pictureId = json["pictureId"].stringValue
        self.city = json["city"].stringValue
        self.rating = json["rating"].doubleValue
    }
}
