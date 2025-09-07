//
//  UserResponse.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import Foundation

struct UserResponse : Identifiable, Codable{
    let id: Int
    var username: String
    var email: String
    var firstName: String
    var lastName: String
    var gender: String
    var image: String
    var accessToken: String
    var refreshToken: String
}

