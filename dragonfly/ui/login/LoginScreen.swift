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
    
    @FocusState private var focusedField: Field?

    enum Field {
        case username, password
    }
    
    var body: some View {
        
        ScrollView{
            
            Spacer()
            
                VStack {
                    Spacer()
                    
                    Image(name: .appLogo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 150)
                        .padding(.bottom, 30)
                    
                    
                        VStack {
                            TextField("Username", text: Binding(
                                get: {viewModel.state.username},
                                set: {viewModel.updateUsername($0)}
                            ))
                            .padding()
                            .focused($focusedField, equals: .username)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                            .padding(.horizontal, 50)
                            .padding(.bottom, 20)
                            .clipShape(.rect(cornerRadius: 4))
                            .background(.background)
                            .submitLabel(.next)
                            .onSubmit {
                                focusedField = .password
                            }.onTapGesture {
                                focusedField = .username
                            }
                            
                            
                            SecureField("Password", text: Binding(
                                get: { viewModel.state.password},
                                set: { viewModel.updatePassword($0)}
                            ))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                            .padding(.horizontal, 50)
                            .padding(.bottom, 20)
                            .focused($focusedField, equals: .password)
                            .submitLabel(.go)
                            .onSubmit {
                                preformLogin()
                            }.onTapGesture {
                                focusedField = .password
                            }
                            
                        }.onAppear{
                            focusedField = .username
                        }
                        
                        Button(action: {
                            preformLogin()
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(height: 50)
                                
                                if viewModel.state.isLoading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                } else {
                                    Text("Login")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                            }
                        }
                        .padding(.horizontal, 50)
                        .disabled(viewModel.state.isLoading)
                        
                    
                    Spacer()
                    
                    
                    if let error = viewModel.state.error {
                                        Text(error)
                                            .foregroundColor(.red)
                                            .padding(.top, 10)
                    }
                                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(.container, edges: .top)
                .onReceive(viewModel.$state) { state in
                    if state.isAuthenticated  {
                        appNavigator.navigateTo(route: .main)
                    }
                }.onTapGesture {
                    focusedField = nil
                }
          
        }
    }
    
    func preformLogin(){
        viewModel.login()
        focusedField = nil
    }
        
}

#Preview {
    LoginScreen()
}
