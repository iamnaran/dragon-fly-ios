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
    
    @Published var products: [ProductEntity] = []

    private var cancellables = Set<AnyCancellable>()
    
    @Published var isLoading: Bool = false
    @Published var error: Error?

    
    init(homeRepository: HomeRepository = HomeRepository()) {
        self.homeRepository = homeRepository
        self.dbManager = DBManager.shared
        fetchAllProducts()
    }
    
    func fetchAllProducts() {
        self.isLoading = true
        self.error = nil
        
        homeRepository.getAllProducts()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error
                    self?.loadProductsFromDB()

                    print("Error fetching products:", error)
                }
            }, receiveValue: { [weak self] allProducts in
                
                // Map API response to Realm entities
                let listOfProducts = ProductMapper.productListToEntityList(allProducts.products)
                
                // Save to DB
                self?.dbManager.insertAll(listOfProducts)
                
                // Update UI
                self?.products = listOfProducts
                
                self?.isLoading = false
            })
            .store(in: &cancellables)
        }
    
    
    // MARK: - Load products from local DB
    private func loadProductsFromDB() {
            let results = dbManager.getAllObjects(ProductEntity.self)
            self.products = Array(results)
            
            if products.isEmpty {
                print("No products in local DB")
            } else {
                print("Loaded \(products.count) products from DB")
            }
        }
    
    
    
}
