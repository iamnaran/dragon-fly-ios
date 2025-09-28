//
//  EndPoints.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import Foundation

struct EndPoints {
    
    private static let baseUrl = "https://dummyjson.com"
    
    static var loginUrl: String {
        return "\(baseUrl)/auth/login"
    }
    
    static var productsUrl: String {
        return "\(baseUrl)/products"
    }
        
}
