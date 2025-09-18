//
//  Product.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/7/25.
//

import SwiftData

@Model
final class ProductData {
    
    @Attribute(.unique) var id: Int
    var title: String
    var productDescription: String
    var price: Double
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand: String?
    var category: String?
    var thumbnail: String?
    var images: [String]?
    
    init(
        id: Int,
        title: String,
        productDescription: String,
        price: Double,
        discountPercentage: Double,
        rating: Double,
        stock: Int,
        brand: String? = nil,
        category: String? = nil,
        thumbnail: String? = nil,
        images: [String]? = nil
    ) {
        self.id = id
        self.title = title
        self.productDescription = productDescription
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.brand = brand
        self.category = category
        self.thumbnail = thumbnail
        self.images = images
    }
}
