//
//  ProfileScreen.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import SwiftUI
import Kingfisher

struct ProfileScreen: View {
    
    @Binding var profilePath: NavigationPath

    @ObservedObject private var viewModel = ProfileViewModel()
    @EnvironmentObject var navigator: AppNavigator
    
    
    @State private var showLogoutAlert = false
    
    
    var body: some View {
                    
            VStack(spacing: 10) {
                KFImage(URL(string: viewModel.user?.image ?? ""))
                    .placeholder {
                        Image(systemName: AppImage.placeholder.rawValue)
                            .resizable()
                            .foregroundColor(.gray.opacity(0.5))
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 4)
                
                Text(viewModel.user?.username ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(viewModel.user?.email ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                AppButton(config: .init(text: "Logout", action: {
                    showLogoutAlert = true
                }))
                
            }
       
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .alert("Logout", isPresented: $showLogoutAlert) {
                            Button("Cancel", role: .cancel) {
                                
                            }
                            Button("Logout", role: .destructive) {
                                performLogout()
                            }
            } message: {
                Text("Are you sure you want to logout?")
            }
            
    }
    
    
    func performLogout() {
        viewModel.logout()
        navigator.popToRoot()
        navigator.navigateTo(route: .login)
    }
}



