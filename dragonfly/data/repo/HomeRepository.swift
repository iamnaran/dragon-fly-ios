//
//  HomeRepository.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import Alamofire
import Combine
import RealmSwift
import SwiftUI

class HomeRepository {
    
    private let dbManager = DBManager.shared
    
    
    func getAllProducts() -> AnyPublisher<ProductResponse, Error> {
        let loginUrl = EndPoints.productsUrl
        let accessToken = AppStorageManager.shared.getLoggedInUserToken()
        var allHeaders: HTTPHeaders = HTTPHeaders()
        allHeaders.add(name: "Authorization", value: "Bearer \(accessToken)")
           
           return NetworkManager.shared.fetchData(url: loginUrl,
                                                   method: .get,
                                                  headers: allHeaders,
                                                   parameters: nil,
                                                   responseType: ProductResponse.self)
    }
    
    
    
    
}
