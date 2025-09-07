//
//  AppComponents.swift
//  dragonfly
//
//  Created by Na Ran on 22/02/2024.
//

import SwiftUI

struct ButtonConfig {
    let text: String
    let action: () -> Void
}

struct AppButton: View {
    let config: ButtonConfig

    var body: some View {
        ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 57)
                    .background(.purple)
                    .cornerRadius(15)
            
                Text(config.text)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.white)
                
                }.padding(.horizontal, 16)
                .padding(.vertical, 4)
                .onTapGesture {
                    config.action()
                }
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(config: .init(text: "String", action: {
           
        }))
    }
}
