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
        
        NavigationStack{
            
            VStack {
                Text("Welcome to Product Screen")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                
            }.toolbar(.hidden)
            
        }
    }
}

struct Product_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen(productId: "1")
    }
}
