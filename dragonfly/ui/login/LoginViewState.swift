//
//  LoginUiState.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import Foundation

struct LoginViewState{
    var username: String = "emilys"
    var password: String = "emilyspass"
    var isLoading: Bool = false
    var isAuthenticated: Bool = false
    var error: String? = nil
}
