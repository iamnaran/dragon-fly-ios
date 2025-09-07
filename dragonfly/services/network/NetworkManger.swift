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
    
    
    func fetchData<T: Decodable>(
        url: String,
        method: HTTPMethod = .get,
        headers: HTTPHeaders? = nil,
        parameters: Parameters? = nil,
        responseType: T.Type,
        token: String? = nil // optional JWT token
    ) -> AnyPublisher<T, Error> {
        
        let publisher = Future<T, Error> { promise in
            
            AF.request(url,
                       method: method,
                       parameters: parameters,
                       encoding: JSONEncoding.default,
                       headers: headers)
                .validate(statusCode: 200...500)
                .responseDecodable(of: T.self) { response in
                    let statusCode = response.response?.statusCode ?? 0
                    if let data = response.data {
                        print("HTTP \(statusCode) response:", String(data: data, encoding: .utf8) ?? "nil")
                    }
                    
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure(let error):
                        if let code = response.response?.statusCode {
                            print("HTTP Code:", code)
                        }
                        promise(.failure(error))
                    }
                }
        }
        .eraseToAnyPublisher()
        
        return publisher
    }
    

    
}
