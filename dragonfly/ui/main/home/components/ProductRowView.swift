//
//  ProductRowItem.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import SwiftUI
import Kingfisher

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        
        VStack(){
            ZStack{
                KFImage(URL(string: product.thumbnail)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 200)
                    .cornerRadius(12)
            }
            
            VStack(alignment: .leading){
                // Product Title
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                // Product Description
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
        }
        .background(Rectangle())
        .foregroundColor(Color.white)
        .cornerRadius(12)
        .padding([.leading,.trailing])
        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = Product(id: 1, title: "Sample Product", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at orci ultrices, feugiat ligula non, posuere nisi.", price: 99, discountPercentage: 0.0, rating: 4.5, stock: 100, brand: "Brand", category: "Category", thumbnail: "sample_thumbnail", images: ["sample_image1", "sample_image2"])
        
        ProductRowView(product: sampleProduct)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
