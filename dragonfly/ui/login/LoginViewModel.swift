//
//  LoginViewModel.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import Foundation
import Combine


class LoginViewModel: ObservableObject{
    
    private let authRepository: AuthService
    
    @Published private(set) var state = LoginViewState()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(authRepository: AuthService = AuthService()) {
        self.authRepository = authRepository
    }
    
    func login() {
        state.isLoading = true
        state.error = nil
        authRepository.login(username: state.username, password: state.password)
            .sink(receiveCompletion: { [weak self] completion in
                DispatchQueue.main.async {
                    self?.state.isLoading = false
                    if case let .failure(error) = completion {
                        self?.state.error = error.localizedDescription
                    }
                }
            }, receiveValue: { [weak self] user in
                DispatchQueue.main.async {
                    self?.state.isAuthenticated = true
                    AppStorageManager.shared.setLoggedInUser(user)
                }
            })
            .store(in: &cancellables)
    }
    
    func updateUsername(_ username: String) {
        state = LoginViewState(
            username: username,
            password: state.password,
            isLoading: state.isLoading,
            isAuthenticated: state.isAuthenticated,
            error: state.error
        )
    }
    
    func updatePassword(_ password: String) {
        state = LoginViewState(
            username: state.username,
            password: password,
            isLoading: state.isLoading,
            isAuthenticated: state.isAuthenticated,
            error: state.error
        )
    }
    
    
    
}
