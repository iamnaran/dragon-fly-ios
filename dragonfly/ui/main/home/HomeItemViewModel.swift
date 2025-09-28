//
//  ProductViewModel.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/7/25.
//

import Combine
import SwiftData
import Foundation

@MainActor
class HomeItemViewModel : ObservableObject {
    
    @Published var products: [ProductDTO] = []

    
}
