//
//  AppColor.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/18/25.
//


import SwiftUI

enum AppColor: String {
    case primary = "Primary"
    case background = "Background"
    case primaryText = "ColorPrimaryText"
    case secondary = "ColorSecondary"
    case secondaryText = "ColorSecondaryText"

    case accent = "ColorAccent"
    
    var color: Color {
        Color(self.rawValue)
    }
}
