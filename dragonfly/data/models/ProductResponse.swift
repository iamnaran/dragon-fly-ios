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
