//
//  NetworkManager.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import Foundation
import Alamofire
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
        
    private init() {
        
        
    }
    
    
    func fetchData<T: Decodable>(url: String,
                                     method: HTTPMethod = .get,
                                     headers: HTTPHeaders? = nil,
                                     parameters: Parameters? = nil,
                                     responseType: T.Type) -> AnyPublisher<T, Error> {
            
            let publisher = Future<T, Error> { promise in
                AF.request(url,
                           method: method,
                           parameters: parameters,
                           headers: headers)
                    .validate()
                    .responseDecodable(of: T.self) { response in
                        switch response.result {
                        case .success(let value):
                            promise(.success(value))
                        case .failure(let error):
                            promise(.failure(error))
                        }
                    }
            }
            .eraseToAnyPublisher()
            
            return publisher
        }
    
    

    
}
