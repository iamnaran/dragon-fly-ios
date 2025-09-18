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

    @Environment(\.theme) var theme

    var body: some View {
        VStack(spacing: theme.spacing.medium) {
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
                .cornerRadius(theme.corners.medium)
                .shadow(color: theme.shadows.light.color,
                        radius: theme.shadows.light.radius,
                        x: theme.shadows.light.x,
                        y: theme.shadows.light.y)

            VStack(alignment: .leading, spacing: theme.spacing.small) {
                Text(product.title)
                    .font(.title)
                    .foregroundColor(theme.colors.text)

                Text(product.descriptionText)
                    .font(.body)
                    .foregroundColor(theme.colors.secondary)
                    .lineLimit(2)
            }
            .padding()
        }
        .padding(theme.spacing.medium)
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


