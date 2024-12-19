//
//  RestaurantCollectionCell.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//

import UIKit
import Kingfisher

class RestaurantCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleRestaurant: UILabel!
    @IBOutlet weak var ratingRestaurant: UILabel!
    @IBOutlet weak var cityRestaurant: UILabel!
    
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupCell() {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "#ECECEC")?.cgColor
        self.clipsToBounds = true
        self.imageView.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
    }
    
    func configure(with restaurant: Restaurant) {
        if let imageUrl = URL(string: "https://restaurant-api.dicoding.dev/images/small/\(restaurant.pictureId)") {
            imageView.kf.setImage(
                with: imageUrl,
                placeholder: UIImage(named: "placeholder"),
                options: [
                    .transition(.fade(0.3)),
                    .cacheOriginalImage
                ]
            )
        }
        
        titleRestaurant.text = restaurant.name
        cityRestaurant.text = restaurant.city
        ratingRestaurant.text = "⭐ \(restaurant.rating)"
        titleRestaurant.textColor = .black
        cityRestaurant.textColor = .black
        ratingRestaurant.textColor = .black
    }
    
    override func prepareForReuse() {
        self.container.backgroundColor = .white
    }
}
