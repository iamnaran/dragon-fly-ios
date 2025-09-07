//
//  Product.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import SwiftUI

struct ProductScreen: View {
    
    let productId: String
    
    @ObservedObject private var viewModel = ProductViewModel()
    
    var body: some View {
        
        VStack {
            Text("Product Id "+productId)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            
        }
    }
}

struct Product_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen(productId: "1")
    }
}
