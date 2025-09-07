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

    
    init(authRepository: AuthRepository = AuthRepository()) {
        self.authRepository = authRepository
    }
    
    func logout(){
        AppStorageManager.shared.setUserLoggedIn(false)
        self.isLoggedOut = true
    }

    
}
