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
        Group {
            if appNavigator.isLoggedIn {
                MainScreen()
                    .environmentObject(appNavigator)
            } else {
//                if appNavigator.isOnBoardCompleted {
                    LoginScreen()
                        .environmentObject(appNavigator)
//                }else{
//                    OnBoardScreen()
//                        .environmentObject(appNavigator)
//                }
            }
        }
    }
}

#Preview {
    RootContainer()
}
