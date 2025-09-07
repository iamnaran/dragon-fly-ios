//
//  NotificationScreen.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//


import Foundation
import SwiftUI

struct NotificationScreen: View {
    @Binding var notificationPath: NavigationPath
    
    @ObservedObject private var viewModel = NotificationViewModel()

    var body: some View {
                    
            VStack {
                Text("Welcome to Notification Screen")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                
            }.navigationTitle("Notification")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

    }
}
