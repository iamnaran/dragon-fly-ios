//
//  ProfileViewModel.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation

class ProfileViewModel : ObservableObject{
    
    private let authRepository: AuthService
    
    @Published var isLoggedOut: Bool = false
    
    @Published var user: UserResponse?

    
    init(authRepository: AuthService = AuthService()) {
        self.authRepository = authRepository
        loadUser()
    }
    
    func logout(){
        AppStorageManager.shared.clearLoggedInUser()
        self.isLoggedOut = true
    }
    
    func loadUser(){
        user = AppStorageManager.shared.getLoggedInUser()
    }

    
}
