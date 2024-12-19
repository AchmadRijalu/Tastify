//
//  HomeRouter.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//



class HomeRouter: PTRHomeProtocol {
    
    
    
    static func createHomeRouter() -> HomeView {
        let view = HomeView()
        let presenter = HomePresenter(viewController: view)
        let interactor: PTIHomeProtocol = HomeInteractor()
        let router: PTRHomeProtocol = HomeRouter()
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        
        
        return view
    }
    
    func navigateToDetailRestaurant(restaurant: RestaurantEntity) {
        
    }
}
