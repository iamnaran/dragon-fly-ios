//
//  ProductViewModel.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/7/25.
//

import Combine
import SwiftData
import Foundation

@MainActor
class HomeItemViewModel : ObservableObject {
    
    @Published var products: [ProductDTO] = []
        @Published var isLoading: Bool = false
        @Published var error: String?

        private let repository: ProductRepository
        private var cancellables = Set<AnyCancellable>()

        init(repository: ProductRepository) {
            self.repository = repository
        }

    
}
