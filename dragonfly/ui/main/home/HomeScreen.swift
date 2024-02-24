//
//  HomeScreen.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//


import SwiftUI
import Foundation
import RealmSwift

struct HomeScreen: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    @EnvironmentObject private var appNavigator: AppNavigator
    
    @ObservedResults(ProductEntity.self) var productEntities

    
    var body: some View {
        
        List(productEntities) { product in
                
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
