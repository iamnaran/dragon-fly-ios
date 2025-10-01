//
//  ProductRowItem.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import SwiftUI
import Kingfisher

struct MessageRow: View {
    let product: ProductData
    let onItemClick: (ProductData) -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            
            KFImage(URL(string: product.thumbnail ?? ""))
                .resizable()
                .placeholder {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 45, height: 45)
                }
                .cacheOriginalImage()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
            
          
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.default.bold())
                    .lineLimit(1)
                
                Text(product.productDescription)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Text("10:24 AM")
                .font(.caption)
                .foregroundColor(.gray)
            
                .padding(AppShape.medium.radius)
                .onTapGesture {
                    onItemClick(product)
                }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onItemClick(product)
        }
    }
    
    
    struct MessageRow_Previews: PreviewProvider {
        static var previews: some View {
            let sampleProduct = ProductData(
                id: 1,
                productId: "1232323",
                title: "Sample Product",
                productDescription: "This is a preview of the product description. Shows text wrapping and layout.",
                price: 99.99,
                discountPercentage: 10,
                rating: 4.5,
                stock: 20,
                brand: "Dragonfly",
                category: "Gadgets",
                thumbnail: "https://via.placeholder.com/400x300.png",
                images: ["https://via.placeholder.com/400x300.png"]
            )
            
            MessageRow(product: sampleProduct, onItemClick: { _ in })
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
    
}
