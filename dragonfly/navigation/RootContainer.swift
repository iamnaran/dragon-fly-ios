//
//  RootView.swift
//  firefly
//
//  Created by Na Ran on 22/02/2024.
//

import SwiftUI

struct RootContainer: View {
    
    @StateObject var appNavigator = AppNavigator()
    

    var body: some View {
        NavigationStack(path: $appNavigator.routes) {
            appNavigator
                .rootScreen()
                .environmentObject(appNavigator)
                .navigationDestination(for: Route.self) { route in
                    appNavigator.getAppScreen(route)
                        .environmentObject(appNavigator)
                }
            }
    }
}

struct RootContainer_Previews: PreviewProvider {
    static var previews: some View {
        RootContainer()
    }
}
