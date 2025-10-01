import SwiftUI
import _SwiftData_SwiftUI

struct MessageScreen: View {
    @Binding var messagePath: NavigationPath
    
    @ObservedObject private var viewModel = MesssageViewModel()
    @EnvironmentObject private var appNavigator: AppNavigator
    @Environment(\.modelContext) private var modelContext

    
    @Query(sort: \ProductData.title) private var products: [ProductData]
    
    var body: some View {
        NavigationStack(path: $messagePath) {
            List(products) { product in
                MessageRow(product: product) { productId in
                    messagePath.append(Route.product(String(product.productId)))
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Messages")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .product(let productId):
                    ProductScreen(productId: productId)
                default:
                    EmptyView()
                }
            }
            .navigationSubtitle("3 unread messages")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
