//
//  AppCheckBox.swift
//  dragonfly
//
//  Created by Na Ran on 24/02/2024.
//

import Foundation

import SwiftUI

struct AppCheckBox: View {
    var title: String
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: { self.isChecked.toggle() }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square": "square")
                Text(title)
            }
            .foregroundColor(isChecked ? .primary : .secondary)
        }
    }
}

struct AppCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AppCheckBox(title: "Test checkbox", isChecked: .constant(true))
            AppCheckBox(title: "Test checkbox", isChecked: .constant(false))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
