//
//  MainScreen.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation

import SwiftUI

struct MainScreen: View {
    
    @ObservedObject private var viewModel = MainViewModel()
    
    @EnvironmentObject private var appNavigator: AppNavigator


    var body: some View {
        
        TabView {
            
            HomeScreen()
                .badge(2)
                .tabItem {
                    Label("Home", systemImage: "house")
                }.environmentObject(appNavigator)
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }.environmentObject(appNavigator)
            NotificationScreen()
                .badge("!")
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }.environmentObject(appNavigator)
        }
        .navigationBarHidden(true)
        .padding(.top, 0)

        
    }
        
}

#Preview {
    MainScreen()
        .environmentObject(AppNavigator())
}


