//
//  ProductRepository.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/7/25.
//

import _SwiftData_SwiftUI
import Combine
import Alamofire
import Foundation

actor ProductRepository {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    // Remote call stays the same
    func fetchRemoteProducts() async throws -> ProductResponse {
          let url = EndPoints.productsUrl
          let token = AppStorageManager.shared.loggedInUserToken
          var headers: HTTPHeaders = [:]
          headers.add(name: "Authorization", value: "Bearer \(token)")
          
          return try await AF.request(
              url,
              method: .get,
              headers: headers
          )
          .serializingDecodable(ProductResponse.self)
          .value
      }
    
    func getLocalProducts() async throws -> [ProductDTO] {
           let descriptor = FetchDescriptor<ProductData>(sortBy: [SortDescriptor(\.id)])
           let results = try context.fetch(descriptor)
           return results.map { ProductDTO(from: $0) }
    }
    
    func saveProducts(_ apiProducts: ProductResponse) throws {
        let descriptor = FetchDescriptor<ProductData>()
        let existing = try context.fetch(descriptor)
        var existingMap = Dictionary(uniqueKeysWithValues: existing.map { ($0.id, $0) })
        
        for p in apiProducts.products {
            if let ex = existingMap[p.id] {
                ex.title = p.title
                ex.productDescription = p.description
                ex.price = p.price
                ex.discountPercentage = p.discountPercentage
                ex.rating = p.rating
                ex.stock = p.stock
                ex.brand = p.brand
                ex.category = p.category
                ex.thumbnail = p.thumbnail
                ex.images = p.images
            } else {
                let new = ProductData(
                    id: p.id,
                    title: p.title,
                    productDescription: p.description,
                    price: p.price,
                    discountPercentage: p.discountPercentage,
                    rating: p.rating,
                    stock: p.stock,
                    brand: p.brand,
                    category: p.category,
                    thumbnail: p.thumbnail,
                    images: p.images
                )
                context.insert(new)
            }
        }
        try context.save()
    }
    
    func deleteProduct(_ product: ProductData) throws {
        context.delete(product)
        try context.save()
    }
}
