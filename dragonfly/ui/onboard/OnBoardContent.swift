//
//  OnBoardContent.swift
//  firefly
//
//  Created by Na Ran on 22/02/2024.
//

import SwiftUI


struct OnBoardItem{
    let image: AppImage
    let title: String
    let subtitle: String
    let gradientColors: [Color]

}

struct OnBoardContent: View {
    let page: OnBoardItem
    
    var body: some View{
        
        VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text(page.title)
                        .fontWeight(.bold)
            
                    Text(page.subtitle)
                    .fontWeight(.medium)
                    
                    Button(action: {
                      
                    }) {
                      HStack(spacing: 8) {
                        Text("Re-Start")
                        
                        Image(systemName: "arrow.right.circle")
                          .imageScale(.large)
                      }
                      .padding(.horizontal, 16)
                      .padding(.vertical, 10)
                      .background(
                        Capsule().strokeBorder(Color.black, lineWidth: 1.25)
                      )
                    } //: BUTTON
                    .accentColor(Color.black)
                }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: page.gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .padding(.horizontal, 20)
        
    }
}
