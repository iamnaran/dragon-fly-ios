//
//  ProductService.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/28/25.
//

import Foundation
import Alamofire
import Combine

class ProductService {
    
    func fetchAllProducts() -> AnyPublisher<[ProductEntity], Error> {
        let url = EndPoints.productsUrl
        let token = AppStorageManager.shared.loggedInUserToken
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        return NetworkManager.shared.fetchData(
            url: url,
            method: .get,
            headers: headers,
            parameters: nil,
            responseType: ProductResponse.self
        )
        .map { $0.products } 
        .eraseToAnyPublisher()
    }
}
