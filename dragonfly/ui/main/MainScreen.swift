import SwiftUI

struct MainScreen: View {
    
    @StateObject private var viewModel = MainViewModel()
    @EnvironmentObject private var appNavigator: AppNavigator

    @State private var homePath = NavigationPath()
    @State private var profilePath = NavigationPath()
    @State private var notificationPath = NavigationPath()
    
    @State private var messagePath = NavigationPath()


    var body: some View {
           TabView {
               // Home tab
               NavigationStack(path: $homePath) {
                   HomeScreen(homePath: $homePath)
               }
               .tabItem { Label("Home", systemImage: "house") }
               .badge(2)

               // Profile tab
               NavigationStack(path: $profilePath) {
                   ProfileScreen(profilePath: $profilePath)
               }
               .tabItem { Label("Profile", systemImage: "person") }

               // Notification tab
               NavigationStack(path: $notificationPath) {
                   NotificationScreen(notificationPath: $notificationPath)
               }
               .tabItem { Label("Notification", systemImage: "bell") }
               
               // Messages tab
               NavigationStack(path: $messagePath) {
                   MessageScreen(messagePath: $messagePath)
               }
               .tabItem { Label("Message", systemImage: "message") }
               .badge("24")
           }
           .environmentObject(appNavigator)
       }
}

#Preview {
    MainScreen()
        .environmentObject(AppNavigator())
}
