//
//  ProductResponse.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation

struct ProductResponse: Codable {
    let products: [ProductEntity]
    let total, skip, limit: Int
}


