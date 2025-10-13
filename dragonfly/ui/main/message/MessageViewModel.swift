//
//  NotificationViewModel.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import SwiftData
import Combine

@MainActor
class MesssageViewModel : ObservableObject{
 
    var modelContext: ModelContext!
    
    private let productService = ProductService()
    @Published var errorMessage: String?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
    }
    
    func fetchProductsFromAPI() {
           productService.fetchAllProducts()
               .receive(on: DispatchQueue.main)
               .sink { [weak self] completion in
                   if case let .failure(error) = completion {
                       self?.errorMessage = error.localizedDescription
                   }
               } receiveValue: { [weak self] productEntities in
                   guard let self, let context = self.modelContext else { return }

                   var newProducts: [ProductData] = []

                   for entity in productEntities {
                       // Fetch all existing products
                       let descriptor = FetchDescriptor<ProductData>()
                       let allProducts = try? context.fetch(descriptor)

                       if let existing = allProducts?.first(where: { (product: ProductData) in
                           product.id == entity.id
                       }) {
                           existing.update(from: entity)
                           newProducts.append(existing)
                       } else {
                           let productData = ProductData(from: entity)
                           context.insert(productData)
                           newProducts.append(productData)
                       }
                   }

                   do {
                       try context.save()
                   } catch {
                       self.errorMessage = "Failed to save products: \(error)"
                   }
               }
               .store(in: &cancellables)
       }
    
}
