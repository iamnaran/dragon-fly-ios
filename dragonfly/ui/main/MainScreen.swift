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

    var body: some View {
        
        TabView {
            HomeScreen()
                .badge(2)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            NotificationScreen()
                .badge("!")
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }
        }
        
    }
        
        
}
