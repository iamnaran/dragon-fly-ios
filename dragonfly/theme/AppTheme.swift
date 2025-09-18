//
//  AppTheme.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/18/25.
//

import SwiftUI

enum AppTheme {
    case light
    case dark
    case ocean
    case forest

    func theme(for scheme: ColorScheme) -> Theme {
        let palette: Palette
        switch self {
        case .light:
            palette = Palette(
                background: .white,
                primary: .blue,
                secondary: .gray.opacity(0.5),
                text: .black,
                accent: .purple
            )
        case .dark:
            palette = Palette(
                background: .black,
                primary: .yellow,
                secondary: .gray.opacity(0.7),
                text: .white,
                accent: .orange
            )
        case .ocean:
            palette = Palette(
                background: scheme == .dark ? Color.indigo.opacity(0.9) : Color.blue.opacity(0.1),
                primary: .teal,
                secondary: .cyan,
                text: .white,
                accent: .mint
            )
        case .forest:
            palette = Palette(
                background: scheme == .dark ? Color.green.opacity(0.7) : Color.green.opacity(0.1),
                primary: .green,
                secondary: .brown,
                text: .black,
                accent: .mint
            )
        }

        let typography = Typography(
            title: .system(size: 28, weight: .bold, design: .rounded),
            body: .system(size: 18, weight: .regular, design: .default),
            caption: .system(size: 14, weight: .light, design: .monospaced)
        )

        let spacing = Spacing(small: 4, medium: 8, large: 16)
        let corners = Corners(small: 4, medium: 8, large: 16)

        let shadows = Shadows(
            light: ShadowStyle(color: .black.opacity(0.1), radius: 2, x: 0, y: 1),
            heavy: ShadowStyle(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)
        )

        return Theme(colors: palette, typography: typography, spacing: spacing, corners: corners, shadows: shadows)
    }
}

