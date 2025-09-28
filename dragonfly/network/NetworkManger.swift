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
        
    init() {
        
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
                    if let data = response.data, let code = response.response?.statusCode, code >= 400 {
                                  // try to parse API error message
                                  if let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                                      promise(.failure(apiError))
                                      return
                                  }
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
