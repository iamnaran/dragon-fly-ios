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
        NavigationStack(path: $homePath) {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.products) { product in
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
        }
    }
}
