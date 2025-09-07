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
    @Binding var homePath: NavigationPath
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    @EnvironmentObject private var appNavigator: AppNavigator
    
    var body: some View {
        List(viewModel.products) { product in
            ProductRowView(product: product) { productId in
                homePath.append(Route.product(productId))
            }
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            )
            .padding(.vertical, 5) // spacing between rows
        }
        .listStyle(PlainListStyle()) // removes extra default padding
        .padding(.horizontal, 10)
        .background(Color(UIColor.systemGroupedBackground))
        .navigationDestination(for: Route.self) { route in
               switch route {
               case .product(let productId):
                   ProductScreen(productId: productId)
               default:
                   EmptyView()
               }
           }
       }
}
