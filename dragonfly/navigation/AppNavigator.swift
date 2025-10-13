import Foundation
import SwiftUI
import Combine

// Define possible navigation destinations
enum Route: Hashable {
    case login
    case main
    case product(String)
    case message(productId: String, productTitle: String)
}

enum Tab {
      case home
      case message
      case profile
      case main
}

class AppNavigator: ObservableObject {
    
    @Published var routes: [Route] = []
    
    @Published var mainPath = NavigationPath()
    @Published var homePath = NavigationPath()
    @Published var profilePath = NavigationPath()
    @Published var notificationPath = NavigationPath()
    @Published var messagePath = NavigationPath()
    
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
    
    // MARK: - Navigate to Product Details Screen
    func navigateToProduct(_ productId: String) {
          // Navigate within Home tab
          homePath.append(Route.product(productId))
    }
    
    // MARK: - Navigate to Chat Screen
    func navigateToMessage(_ productId: String, productTitle: String) {
          // Navigate within Message tab
          messagePath.append(Route.message(productId: productId, productTitle: productTitle))
    }
    
    func navigateTo(route: Route, in tab: Tab = .main) {
           switch tab {
           case .home:
               homePath.append(route)
           case .message:
               messagePath.append(route)
           case .profile:
               profilePath.append(route)
           case .main:
               mainPath.append(route)
           }
       }
    
    func navigateUp(in tab: Tab = .main) {
         switch tab {
         case .home:
             if !homePath.isEmpty { homePath.removeLast() }
         case .message:
             if !messagePath.isEmpty { messagePath.removeLast() }
         case .profile:
             if !profilePath.isEmpty { profilePath.removeLast() }
         case .main:
             if !mainPath.isEmpty { mainPath.removeLast() }
         }
     }
     
    func popToRoot(in tab: Tab = .main) {
         switch tab {
         case .home: homePath = NavigationPath()
         case .message: messagePath = NavigationPath()
         case .profile: profilePath = NavigationPath()
         case .main: mainPath = NavigationPath()
         }
     }
    
    func popToRoot() {
        routes.removeAll()
    }
}
