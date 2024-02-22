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
}

struct OnBoardContent: View {
    let page: OnBoardItem
    
    var body: some View{
        VStack{
        
            Text(page.title)
            Text(page.subtitle)

            
        }
        
    }
}
