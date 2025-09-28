//
//  HomeScreen.swift
//  firefly
//
//  Created by Na Ran on 20/02/2024.
//


import SwiftUI
import Foundation
import _SwiftData_SwiftUI

struct HomeScreen: View {
    @Binding var homePath: NavigationPath
    @EnvironmentObject private var appNavigator: AppNavigator
    
    @Environment(\.modelContext) private var modelContext
    @ObservedObject private var viewModel = HomeViewModel()
    @Query private var products: [ProductData]


    var body: some View {
        NavigationStack(path: $homePath) {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(products) { product in
                        ProductRowView(product: product) { productId in
                            homePath.append(Route.product(productId))
                        }
                        .background(
                               RoundedRectangle(cornerRadius: 20)
                                   .fill(.ultraThinMaterial) 
                                   .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                           )
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .product(let productId):
                    ProductScreen(productId: productId)
                default:
                    EmptyView()
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear{
                viewModel.modelContext = self.modelContext
                viewModel.fetchProductsFromAPI()
            }
        }
    }
}
