//
//  ProductResponse.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Identifiable, Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category, thumbnail: String
    let images: [String]
}
