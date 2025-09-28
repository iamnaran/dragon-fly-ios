//
//  ProductEntity.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/28/25.
//

struct ProductEntity: Identifiable, Codable {
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
}
