//
//  ThemeProvider.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/18/25.
//

import SwiftUI


struct ThemeProvider<Content: View>: View {
    @Environment(\.colorScheme) var scheme
    @EnvironmentObject var manager: ThemeManager

    let content: () -> Content

    var body: some View {
        content()
            .environment(\.theme, manager.currentTheme.theme(for: scheme))
    }
}
