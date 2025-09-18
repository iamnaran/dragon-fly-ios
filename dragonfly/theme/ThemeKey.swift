//
//  ThemeKey.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/18/25.
//

import SwiftUI


private struct ThemeKey: EnvironmentKey {
    static let defaultValue = AppTheme.light.theme(for: .light)
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
