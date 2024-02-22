//
//  HomeViewModel.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject{
 
    private let homeRepository: HomeRepository
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var products: [Product] = []

    
    init(homeRepository: HomeRepository = HomeRepository()) {
        self.homeRepository = homeRepository
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
                self?.isLoading = false
                self?.products = allProducts.products
            })
            .store(in: &cancellables)
    }
    
    
    
}
