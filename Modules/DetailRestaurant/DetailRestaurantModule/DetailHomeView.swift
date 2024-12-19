//
//  DetailHomeView.swift
//  Tastify
//
//  Created by Achmad Rijalu on 17/12/24.
//

import UIKit



protocol DetailRestaurantDisplayLogic: AnyObject {
    var presenter: DetailRestaurantModulePresenterInput! {get set}
    
    
    func displayDetailRestaurant(name: String, description: String, city: String, address: String, pictureId: String, categories: [Category], foods: [MenuItem], drinks: [MenuItem])
}

class DetailHomeView: UIViewController {
    
    @IBOutlet weak var favoriteButtonContainer: UIView!
    @IBOutlet weak var backButtonContainer: UIView!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var favoriteButton: UIImageView!
    @IBOutlet weak var restaurantTitle: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantCity: UILabel!
    @IBOutlet weak var restaurantDescription: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    @IBOutlet weak var drinkCollectionView: UICollectionView!
    
    
    var presenter: DetailRestaurantModulePresenterInput!

    override func viewDidLoad() {
        self.setupView()
        self.setupAction()
        self.presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @objc private func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func addToFavorite() {
        
    }
    
    private func setupView() {
        self.backButtonContainer.layer.cornerRadius = 10
        self.backButton.backgroundColor = .black
        self.backButton.tintColor = .white
        self.backButton.backgroundColor = .black
        self.favoriteButtonContainer.layer.cornerRadius = 10
        self.favoriteButton.tintColor = .red
        
    }
    
    private func setupAction() {
        let backButtonImageGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonAction))
        self.backButton.isUserInteractionEnabled = true
        self.backButton.addGestureRecognizer(backButtonImageGesture)
    }
    
}

extension DetailHomeView: DetailRestaurantDisplayLogic {
    func displayDetailRestaurant(name: String, description: String, city: String, address: String, pictureId: String, categories: [Category], foods: [MenuItem], drinks: [MenuItem]) {
        self.restaurantTitle.text = name
        self.restaurantCity.text = city
        self.restaurantAddress.text = address
        self.restaurantDescription.text = description
        self.restaurantImage.image = UIImage(named: pictureId)
    }
    
    
    
}


