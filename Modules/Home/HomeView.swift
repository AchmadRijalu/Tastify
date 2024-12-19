//
//  HomeView.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//


import UIKit

class HomeView: UIViewController {
    
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var restaurantCollectionView: UICollectionView!
    @IBOutlet weak var restaurantTextField: UITextField!
    private var restaurantList: [Restaurant] = []
    
    var presenter: VTPHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.fetchRestaurantList()
    }
    
    private func setupView() {
        // Set up collection view data source and delegate
        restaurantCollectionView.dataSource = self
        restaurantCollectionView.delegate = self
        registerCollection()
        
        
    }
    private func fetchRestaurantList() {
        guard let navigation = self.navigationController else { return }
        presenter?.didFetchRestaurantList(navigationController: navigation)
    }
    
    private func registerCollection() {
        restaurantCollectionView.register(
            UINib(nibName: "RestaurantCollectionCell", bundle: nil),
            forCellWithReuseIdentifier: "RestaurantCollectionCell"
        )
    }
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "RestaurantCollectionCell",
            for: indexPath
        ) as? RestaurantCollectionCell else {
            return UICollectionViewCell()
        }
        let restaurant = restaurantList[indexPath.row]
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(named: "#ECECEC")?.cgColor
        cell.clipsToBounds = true
        cell.imageView.layer.cornerRadius = 10
        cell.imageView.layer.cornerRadius = 12
        cell.imageView.layer.masksToBounds = true
        cell.configure(with: restaurant)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let horizontalInset: CGFloat = 16
        let verticalInset: CGFloat = 20
        return UIEdgeInsets(top: verticalInset - 5, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    //Jarak antar item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    //Ukuran Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: 150)
    }
    
    //Tap to navigate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let restaurant = restaurantList[indexPath.row]
        let router = DetailRestaurantModuleRouter()
        router.routeToDetailRestauant(selectedRestaurant: restaurant.id)
        
    }
    
    
}

extension HomeView: PTVHomeProtocol {
    func onSuccessFetchRestaurantList(restaurantList: RestaurantEntity) {
        self.restaurantList = restaurantList.restaurants
        DispatchQueue.main.async {
            self.restaurantCollectionView.reloadData()
        }
    }
    
    func onFailureFetchRestaurantList(restaurantList: RestaurantEntity) {
        
    }
}

