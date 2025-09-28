//
//  UserRepository.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import Foundation
import Alamofire
import Combine

class AuthService{
    
    
    init(){
        
    }
        
    func login(username: String, password: String) -> AnyPublisher<UserResponse, Error> {
           let loginUrl = EndPoints.loginUrl
           let parameters: Parameters = [
               "username": username,
               "password": password
           ]
           
           return NetworkManager.shared.fetchData(url: loginUrl,
                                                   method: .post,
                                                   parameters: parameters,
                                                   responseType: UserResponse.self)
       }
    
    
}
