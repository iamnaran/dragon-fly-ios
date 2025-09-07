//
//  ProfileViewModel.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation

class ProfileViewModel : ObservableObject{
    
    private let authRepository: AuthRepository
    
    @Published var isLoggedOut: Bool = false
    
    @Published var user: UserResponse?

    
    init(authRepository: AuthRepository = AuthRepository()) {
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
