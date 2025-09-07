//
//  ProductEntity.swift
//  dragonfly
//
//  Created by Na Ran on 24/02/2024.
//

import Foundation
import RealmSwift

class ProductEntity: Object, Identifiable {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var price: Double = 0.0
    @objc dynamic var discountPercentage: Double = 0.0
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var stock: Int = 0
    @objc dynamic var brand: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var thumbnail: String = ""
    let images = List<String>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
