//
//  APIError.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/7/25.
//

import Foundation

struct APIError: Decodable, LocalizedError {
    let message: String
    
    var errorDescription: String? { message }
}
