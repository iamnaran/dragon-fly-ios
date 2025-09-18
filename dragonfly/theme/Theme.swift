//
//  Palette.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/18/25.
//

import SwiftUI

struct Theme {
    let colors: Palette
    let typography: Typography
    let spacing: Spacing
    let corners: Corners
    let shadows: Shadows
}

struct Palette {
    let background: Color
    let primary: Color
    let secondary: Color
    let text: Color
    let accent: Color
}

struct Typography {
    let title: Font
    let body: Font
    let caption: Font
}

struct Spacing {
    let small: CGFloat
    let medium: CGFloat
    let large: CGFloat
}

struct Corners {
    let small: CGFloat
    let medium: CGFloat
    let large: CGFloat
}

struct Shadows {
    let light: ShadowStyle
    let heavy: ShadowStyle
}

struct ShadowStyle {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
}
