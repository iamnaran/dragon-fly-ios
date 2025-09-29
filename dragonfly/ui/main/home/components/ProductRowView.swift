//
//  ProductRowItem.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import SwiftUI
import Kingfisher

struct ProductRowView: View {
    let product: ProductData
    let onItemClick: (String) -> Void
    


    var body: some View {
        VStack(spacing: AppShape.medium.radius) {
            let screenHeight = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first?.screen.bounds.height ?? 800 

            let imageHeight = screenHeight / 3

            KFImage(URL(string: product.thumbnail ?? ""))
                .resizable()
                .placeholder {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: .infinity, height: imageHeight)
                }
                .cacheOriginalImage()
                .scaledToFill()
                .frame(width: .infinity, height: imageHeight)
                .clipped()
         
            VStack(alignment: .leading, spacing: AppShape.medium.radius) {
                Text(product.title)
                    .font(.title)
                    .foregroundColor(AppColor.primaryText.color)

                Text(product.productDescription)
                    .font(.body)
                    .foregroundColor(AppColor.secondaryText.color)
                    .lineLimit(2)
            }
            .padding()
        }
        .padding(AppShape.medium.radius)
        .onTapGesture {
            onItemClick(product.title)
        }
    }
}


struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = ProductData(
            id: 1,
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
        
        ProductRowView(product: sampleProduct, onItemClick: { _ in })
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

