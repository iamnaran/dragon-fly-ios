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
    let onItemClick: (String) -> Void // Closure to handle tap

    
    var body: some View {
        
        VStack {
            KFImage(URL(string: product.thumbnail)!)
                .placeholder {
                    Image(AppImage.placeholder.rawValue)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                }.background(Color.white)
                 .aspectRatio(contentMode: .fit)
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
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .foregroundColor(Color.gray)
        .onTapGesture {
            onItemClick(product.title)
        }
        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = ProductEntity()
        
        ProductRowView(product: sampleProduct){ productId in
            
            
        }
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
