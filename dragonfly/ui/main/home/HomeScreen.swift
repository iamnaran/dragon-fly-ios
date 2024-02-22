//
//  HomeScreen.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//


import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        
            List(viewModel.products) { product in
                
                ProductRowView(product: product)
                    .listRowSeparator(.hidden)
                    .contentShape(Rectangle())
                
            }
            .listStyle(DefaultListStyle())
            .listRowSeparator(.hidden)
            .padding(8)
          
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
