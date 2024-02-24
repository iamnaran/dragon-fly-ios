//
//  NotificationScreen.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//


import Foundation
import SwiftUI

struct NotificationScreen: View {
    
    @ObservedObject private var viewModel = NotificationViewModel()

    var body: some View {
                    
            VStack {
                Text("Welcome to Notification Screen")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                
            }.toolbar(.hidden)

    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        NotificationScreen()
    }
}
