import Foundation
import SwiftUI
import Combine

// Define possible navigation destinations
enum Route: Hashable {
    case login
    case main
    case product(String)
}

class AppNavigator: ObservableObject {
    
    @Published var routes: [Route] = []

    let appStorage = AppStorageManager.shared

    var isLoggedIn: Bool {
        appStorage.isUserLoggedIn
    }
    
    var isOnBoardCompleted: Bool {
        appStorage.isOnBoarded
    }

    // MARK: - Root screen decides login/main
    @ViewBuilder
    func rootScreen() -> some View {
        if isLoggedIn {
            MainScreen()
        } else {
            LoginScreen()
        }
    }

    // MARK: - Programmatic navigation inside tabs
    func navigateToProduct(_ productId: String) {
        // This method can be called from HomeScreen's NavigationStack
        routes.append(.product(productId))
    }
    
    func navigateTo(route: Route) {
        routes.append(route)
    }

    func navigateUp() {
        guard !routes.isEmpty else { return }
        routes.removeLast()
    }

    func popToRoot() {
        routes.removeAll()
    }
}
