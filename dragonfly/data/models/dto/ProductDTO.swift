//
//  ProductDTO.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/7/25.
//

import Foundation

struct ProductDTO: Identifiable, Codable, Sendable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String?
    let category: String?
    let thumbnail: String?
    let images: [String]?

    init(from data: ProductData) {
        self.id = data.id
        self.title = data.title
        self.description = data.productDescription
        self.price = data.price
        self.discountPercentage = data.discountPercentage
        self.rating = data.rating
        self.stock = data.stock
        self.brand = data.brand
        self.category = data.category
        self.thumbnail = data.thumbnail
        self.images = data.images
    }

    init(from apiModel: ProductEntity) {
        self.id = apiModel.id
        self.title = apiModel.title
        self.description = apiModel.description
        self.price = apiModel.price
        self.discountPercentage = apiModel.discountPercentage
        self.rating = apiModel.rating
        self.stock = apiModel.stock
        self.brand = apiModel.brand
        self.category = apiModel.category
        self.thumbnail = apiModel.thumbnail
        self.images = apiModel.images
    }
}
