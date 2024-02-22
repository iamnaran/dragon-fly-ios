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
enum Route: Hashable, Identifiable {
    var id: Self {
        return self
    }
    
    case login
    case main
    case product(String)
    
    
    // Builds the views
    @ViewBuilder
    var screen: some View {
        switch self {
        case .login:
            LoginScreen()
        case .main:
            MainScreen()
        case .product(let productId):
            ProductScreen(productId: productId)
       
        }
    }
    
}


final class AppRouter : ObservableObject {
    
    @Published var routes: [Route] = []

    
    // Used by views to navigate to another view
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
