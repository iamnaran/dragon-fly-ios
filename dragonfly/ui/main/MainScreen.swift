import SwiftUI

struct MainScreen: View {
    
    @StateObject private var viewModel = MainViewModel()
    @EnvironmentObject private var appNavigator: AppNavigator
    
    var body: some View {
        
        TabView {
            NavigationStack(path: $appNavigator.homePath){
                HomeScreen()
            }
            .tabItem { Label("Home", systemImage: "house") }
            .badge(2)
            
            MessageScreen()
                .tabItem { Label("Message", systemImage: "message") }
                .badge("9")
            
            ProfileScreen()
                .tabItem { Label("Profile", systemImage: "person") }
            
        }
        .environmentObject(appNavigator)
        
    }
    
}




#Preview {
    MainScreen()
        .environmentObject(AppNavigator())
}
