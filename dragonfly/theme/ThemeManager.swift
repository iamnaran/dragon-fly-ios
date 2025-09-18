//
//  ThemeManager.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/18/25.
//

import Combine


class ThemeManager: ObservableObject {
    @Published var currentTheme: AppTheme = .light
}
