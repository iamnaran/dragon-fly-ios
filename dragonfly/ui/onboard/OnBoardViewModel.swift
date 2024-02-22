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
            OnBoardItem(image: .appLogo, title: "title", subtitle: "Sub title"),
            OnBoardItem(image: .appLogo, title: "title", subtitle: "Sub title")                                      ]
    }
}
