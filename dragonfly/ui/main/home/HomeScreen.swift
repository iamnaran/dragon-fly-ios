//
//  HomeScreen.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//


import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    @EnvironmentObject private var appNavigator: AppNavigator

    
    var body: some View {
        
            List(viewModel.products) { product in
                
                ProductRowView(product: product){ productId in
                    
                    appNavigator.navigateTo(route: .product(productId))
                    
                }.listRowSeparator(.hidden)
                
            }
            .listStyle(.inset)
          
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
