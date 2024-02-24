//
//  AuthMapper.swift
//  dragonfly
//
//  Created by Na Ran on 24/02/2024.
//

import Foundation

class ProductMapper {
    
    static func productFromEntity(_ entity: ProductEntity) -> Product {
        return Product(id: Int(entity.id) ?? 0,
                       title: entity.title,
                       description: entity.descriptionText,
                       price: entity.price,
                       discountPercentage: entity.discountPercentage,
                       rating: entity.rating,
                       stock: entity.stock,
                       brand: entity.brand,
                       category: entity.category,
                       thumbnail: entity.thumbnail,
                       images: Array(entity.images))
    }

    static func productToEntity(_ product: Product) -> ProductEntity {
        let entity = ProductEntity()
        entity.id = String(entity.id)
        entity.title = product.title
        entity.descriptionText = product.description
        entity.price = product.price
        entity.discountPercentage = product.discountPercentage
        entity.rating = product.rating
        entity.stock = product.stock
        entity.brand = product.brand
        entity.category = product.category
        entity.thumbnail = product.thumbnail
        entity.images.append(objectsIn: product.images)
        return entity
    }
    
    static func productListToEntityList(_ products: [Product]) -> [ProductEntity] {
         return products.map { productToEntity($0) }
     }
     
     static func entityListToProductList(_ entities: [ProductEntity]) -> [Product] {
         return entities.map { productFromEntity($0) }
     }
}
