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
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    @EnvironmentObject private var appNavigator: AppNavigator
    

    
    var body: some View {
        
        VStack{
            Text("Home").font(.headline)
            
            List(viewModel.products) { product in
                    
                ProductRowView(product: product){ productId in
                    
                    appNavigator.navigateTo(route: .product(productId))
                    
                }.listRowSeparator(.hidden)
                    
            }
            .listStyle(.inset)
        }
        
       
          
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
