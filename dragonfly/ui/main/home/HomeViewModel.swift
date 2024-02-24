//
//  HomeViewModel.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import Foundation
import Combine
import RealmSwift

class HomeViewModel : ObservableObject{
 
    private let homeRepository: HomeRepository
    private let dbManager: DBManager
    
    @Published var productResults: Results<ProductEntity>?
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isLoading: Bool = false
    @Published var error: Error?

    
    init(homeRepository: HomeRepository = HomeRepository()) {
        self.homeRepository = homeRepository
        self.dbManager = DBManager.shared
        getAllProducts()
    }
    
    func getAllProducts() {
        self.isLoading = true

        homeRepository.getAllProducts()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                    break
                case .failure(let error):
                    self?.error = error
                }
            }, receiveValue: { [weak self] allProducts in
                
                let listOfProducts = ProductMapper.productListToEntityList(allProducts.products)
                self?.dbManager.insertAll(objects: listOfProducts)
                self?.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    
    
}
