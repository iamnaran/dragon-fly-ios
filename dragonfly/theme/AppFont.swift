//
//  AppFonts.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/18/25.
//

import SwiftUI

enum AppFont {
    case title
    case body
    case caption
    
    var font: Font {
        switch self {
        case .title: return Font.custom("AvenirNext-Bold", size: 22)
        case .body: return Font.custom("AvenirNext-Regular", size: 16)
        case .caption: return Font.custom("AvenirNext-Medium", size: 13)
        }
    }
}
