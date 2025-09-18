//
//  AppShapes.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/18/25.
//

import SwiftUI

enum AppShape {
    case small
    case medium
    case large
    
    var radius: CGFloat {
        switch self {
        case .small: return 8
        case .medium: return 16
        case .large: return 24
        }
    }
}
