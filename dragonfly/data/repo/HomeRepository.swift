//
//  HomeRepository.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import Foundation
import Alamofire
import Combine

class HomeRepository{
        
    func getAllProducts() -> AnyPublisher<ProductResponse, Error> {
        let loginUrl = EndPoints.productsUrl
           return NetworkManager.shared.fetchData(url: loginUrl,
                                                   method: .get,
                                                   parameters: nil,
                                                   responseType: ProductResponse.self)
    }
    
    
}
