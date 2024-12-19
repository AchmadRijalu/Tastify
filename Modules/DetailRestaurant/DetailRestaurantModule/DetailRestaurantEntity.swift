//
//  DetailRestaurantEntity.swift
//  Tastify
//
//  Created by Achmad Rijalu on 18/12/24.
//


import SwiftyJSON


struct DetailRestaurantEntity {
    let error: Bool
    let message: String
    let restaurant: DetailRestaurant
    
    init(json: JSON) {
        self.error = json["error"].boolValue
        self.message = json["message"].stringValue
        self.restaurant = DetailRestaurant(json: json["restaurant"])
    }
}


struct DetailRestaurant {
    let id: String
    let name: String
    let description: String
    let city: String
    let address: String
    let pictureId: String
    let categories: [Category]
    let menus: Menus
    let rating: Double
    let customerReviews: [CustomerReview]
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.description = json["description"].stringValue
        self.city = json["city"].stringValue
        self.address = json["address"].stringValue
        self.pictureId = json["pictureId"].stringValue
        self.categories = json["categories"].arrayValue.map { Category(json: $0) }
        self.menus = Menus(json: json["menus"])
        self.rating = json["rating"].doubleValue
        self.customerReviews = json["customerReviews"].arrayValue.map { CustomerReview(json: $0) }
    }
}


struct Category {
    let name: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
    }
}


struct Menus {
    let foods: [MenuItem]
    let drinks: [MenuItem]
    
    init(json: JSON) {
        self.foods = json["foods"].arrayValue.map { MenuItem(json: $0) }
        self.drinks = json["drinks"].arrayValue.map { MenuItem(json: $0) }
    }
}


struct MenuItem {
    let name: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
    }
}

struct CustomerReview {
    let name: String
    let review: String
    let date: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.review = json["review"].stringValue
        self.date = json["date"].stringValue
    }
}

