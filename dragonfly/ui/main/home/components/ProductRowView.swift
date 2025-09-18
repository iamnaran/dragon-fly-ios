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
        VStack(spacing: AppShape.medium.radius) {
            let screenHeight = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first?.screen.bounds.height ?? 800 

            let imageHeight = screenHeight / 3

            KFImage(URL(string: product.thumbnail))
                .resizable()
                .scaledToFill()
                .frame(height: imageHeight)
                .frame(maxWidth: .infinity)
                .clipped()
         
            VStack(alignment: .leading, spacing: AppShape.medium.radius) {
                Text(product.title)
                    .font(.title)
                    .foregroundColor(AppColor.primaryText.color)

                Text(product.descriptionText)
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


#Preview {
    ProductRowView(product: ProductEntity()) { title in
        print("Tapped: \(title)")
    }
}


