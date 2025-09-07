//
//  ProductRowItem.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import SwiftUI
import Kingfisher

struct ProductRowView: View {
    let product: ProductEntity
    let onItemClick: (String) -> Void

    
    var body: some View {
        
        VStack {
            KFImage(URL(string: product.thumbnail)!)
                .placeholder {
                    Image(AppImage.placeholder.rawValue)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                }
                .aspectRatio(contentMode: .fill)
                 .frame(
                    width: abs(UIScreen.main.bounds.width - 30),
                    height: 200)
                 .clipped()

            VStack(alignment: .leading) {
                // Product Title
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(EdgeInsets(
                        top: 4,
                        leading: 0,
                        bottom: 4,
                        trailing: 0))

                // Product Description
                Text(product.descriptionText)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .padding(EdgeInsets(
                        top: 4,
                        leading: 0,
                        bottom: 4,
                        trailing: 0))

            }.padding()
            
        }
        .frame(width:  UIScreen.main.bounds.width - 30)
        .onTapGesture {
            onItemClick(product.title)
        }
        
    }
}


#Preview {
    ProductRowView(product: ProductEntity()) { title in
        print("Tapped: \(title)")
    }
}


