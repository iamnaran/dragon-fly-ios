//
//  RootView.swift
//  firefly
//
//  Created by Na Ran on 22/02/2024.
//

import SwiftUI

struct RootContainer: View {

    @StateObject var appNavigator = AppNavigator()
    @StateObject var themeManager = ThemeManager()

    var body: some View {
        Group {
            if appNavigator.isLoggedIn {
                MainScreen()
                    .environmentObject(appNavigator)
                    .environmentObject(themeManager)
            } else {
                LoginScreen()
                    .environmentObject(appNavigator)
                    .environmentObject(themeManager)
            }
        }
    }
}

#Preview {
    RootContainer()
}
