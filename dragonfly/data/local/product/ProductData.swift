//
//  ProductEntity.swift
//  dragonfly
//
//  Created by Na Ran on 24/02/2024.
//

import SwiftData
import Foundation

@Model
final class ProductData {
    
    @Attribute(.unique) var id: Int
    var productId: String
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
        productId: String,
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
        self.productId = productId
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


extension ProductData {
    func toDomain() -> ProductData {
        ProductData(
            id: id,
            productId: productId,
            title: title,
            productDescription: productDescription,
            price: price,
            discountPercentage: discountPercentage,
            rating: rating,
            stock: stock,
            brand: brand,
            category: category,
            thumbnail: thumbnail,
            images: images ?? []
        )
    }
    
    convenience init(from product: ProductEntity) {
        self.init(
            id: product.id,
            productId: String(product.id),
            title: product.title,
            productDescription: product.description,
            price: product.price,
            discountPercentage: product.discountPercentage,
            rating: product.rating,
            stock: product.stock,
            brand: product.brand,
            category: product.category,
            thumbnail: product.thumbnail,
            images: product.images
        )
    }
    
    func update(from product: ProductEntity) {
        productId = String(product.id)
           title = product.title
           productDescription = product.description
           price = product.price
           discountPercentage = product.discountPercentage
           rating = product.rating
           stock = product.stock
           brand = product.brand
           category = product.category
           thumbnail = product.thumbnail
           images = product.images
    }
    
}


extension ProductData {
    // Dummy sample products
    static let sampleProducts: [ProductData] = [
        ProductData(
            id: 1,
            productId: "123",
            title: "iPhone 15",
            productDescription: "Apple's latest smartphone with A17 chip",
            price: 1099,
            discountPercentage: 10,
            rating: 4.8,
            stock: 50,
            brand: "Apple",
            category: "Smartphone",
            thumbnail: "https://example.com/iphone15.jpg",
            images: ["https://example.com/iphone15_1.jpg", "https://example.com/iphone15_2.jpg"]
        ),
        ProductData(
            id: 2,
            productId: "234",
            title: "MacBook Pro 16",
            productDescription: "High performance laptop with M2 Max chip",
            price: 3499,
            discountPercentage: 5,
            rating: 4.9,
            stock: 20,
            brand: "Apple",
            category: "Laptop",
            thumbnail: "https://example.com/macbookpro16.jpg",
            images: ["https://example.com/macbookpro16_1.jpg"]
        ),
        ProductData(
            id: 3,
            productId: "22323",
            title: "AirPods Pro",
            productDescription: "Noise-cancelling earbuds with spatial audio",
            price: 249,
            discountPercentage: 15,
            rating: 4.7,
            stock: 100,
            brand: "Apple",
            category: "Accessories",
            thumbnail: "https://example.com/airpodspro.jpg",
            images: ["https://example.com/airpodspro_1.jpg"]
        )
    ]
}
