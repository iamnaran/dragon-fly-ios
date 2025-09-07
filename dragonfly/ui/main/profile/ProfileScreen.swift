//
//  ProfileScreen.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject private var viewModel = ProfileViewModel()
    @EnvironmentObject var navigator: AppNavigator
    
    
    var body: some View {
                    
            VStack {
                Text("Welcome to Profile Screen")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                
                AppButton(config: .init(text: "Logout", action: {
                    viewModel.logout()
                }))
                
            }.toolbar(.hidden)
        
        
            
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
