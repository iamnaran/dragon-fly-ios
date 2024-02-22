//
//  LoginViewModel.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import Foundation
import Combine


class LoginViewModel: ObservableObject{
    
    private let authRepository: AuthRepository
    
    @Published var isAuthenticated: Bool = false
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
        
    init(authRepository: AuthRepository = AuthRepository.shared) {
        self.authRepository = authRepository
    }
    
    func login(with loginState: LoginViewState) {
        self.isAuthenticated = true
        authRepository.login(username: loginState.username, password: loginState.password)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error
                }
            }, receiveValue: { [weak self] user in
                AppStorageManager.shared.setUserLoggedIn(true)
                self?.isAuthenticated = true
            })
            .store(in: &cancellables)
    }
    
}
