//
//  AppImages.swift
//  firefly
//
//  Created by Na Ran on 22/02/2024.
//

import Foundation
import SwiftUI

enum AppImage: String{
    case appLogo = "FireflyLogo"
    case placeholder = "Placeholder"
}

extension Image {
    
    init(name: AppImage){
        self.init(name.rawValue)
    }
    
}
