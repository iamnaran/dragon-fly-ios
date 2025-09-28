//
//  OnBoardViewModel.swift
//  firefly
//
//  Created by Na Ran on 22/02/2024.
//

import Foundation

class OnBoardViewModel : ObservableObject{
    
    @Published var onBoardItems: [OnBoardItem]
    
    init() {
        onBoardItems = [
            OnBoardItem(image: .appLogo, title: "Welcome to Dragonfly", subtitle: "An app made with SwiftUI", gradientColors: [AppColor.accent.color, AppColor.primary.color]),
            OnBoardItem(image: .appLogo, title: "Refreshed IOS26 UI ", subtitle: "Firefly usages all the default components", gradientColors: [AppColor.primary.color, AppColor.accent.color])                                      ]
    }
}
