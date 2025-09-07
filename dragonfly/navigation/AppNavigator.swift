//
//  AppRouter.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import SwiftUI
import Combine


// Contains the possible destinations in our Router
enum Route: Hashable {
    case login
    case main
    case product(String)
    
}

class AppNavigator : ObservableObject {
    
    @Published var routes: [Route] = []
        
    let appStorage = AppStorageManager.shared

    var isLoggedIn: Bool {
        appStorage.isUserLoggedIn()
    }
    
    @ViewBuilder
    func rootScreen() -> some View{
        if(isLoggedIn){
            MainScreen()
        }else{
            LoginScreen()
        }
        
    }
    
// MARK: - Builds views for screen
    @ViewBuilder
    func getAppScreen(_ route: Route) -> some View {
        switch route {
        case .login:
            LoginScreen()
        case .main:
            MainScreen()
        case .product(let productId):
            ProductScreen(productId: productId)
       
        }
    }
    
// MARK: - Used by views to navigate to another view
    
    func navigateTo(route: Route) {
        routes.append(route)
    }
    
    // Back to navigation
    func navigateUp() {
        routes.removeLast()
    }
    
    func popToRoot() {
        routes.removeLast(routes.count)
    }
    
}
