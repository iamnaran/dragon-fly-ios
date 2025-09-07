//
//  LoginScreen.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject private var appNavigator: AppNavigator

    @ObservedObject private var viewModel = LoginViewModel()
    
    @State private var loginState = LoginViewState()
    
    @State private var isAnimating = false


    var body: some View {
        
        
        ZStack {
            VStack {
                
                Spacer()
                
                Image(name: .appLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                    .offset(y: isAnimating ? 45 : 0)
                            .animation(
                            .easeInOut(duration: 5)
                            .repeatForever(autoreverses: true), value: isAnimating)
                    .padding(.bottom, 30)
                
                
                VStack {
                    TextField("Username", text: $loginState.username)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                        .padding(.horizontal, 50)
                        .padding(.bottom, 20)
                    
                    SecureField("Password", text: $loginState.password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                        .padding(.horizontal, 50)
                        .padding(.bottom, 20)
                }
                
                Button(action: {
                    viewModel.login(with: loginState)
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 50)
                
                VStack {
                    if viewModel.isAuthenticated {
                        Text("Logged in!")
                            .foregroundColor(.green)
                            .padding(.top, 20)
                    }
                    
                    if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")
                            .foregroundColor(.red)
                            .padding(.top, 20)
                    }
                }
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .ignoresSafeArea(.keyboard)
        .background(Color.white)
        .onReceive(viewModel.$isAuthenticated) { isAuthenticated in
            if isAuthenticated {
                    let navigator = appNavigator
                    navigator.navigateTo(route: .main)
                }
        }
        .onAppear {
            withAnimation(.linear(duration: 1)) {
                           isAnimating = true
            }
        }
      
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
