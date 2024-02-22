//
//  OnBoardScreen.swift
//  firefly
//
//  Created by Na Ran on 22/02/2024.
//

import Foundation
import SwiftUI

struct OnBoardScreen: View{
    
    @ObservedObject private var viewModel = OnBoardViewModel()
    
    var body: some View{
        TabView{
            ForEach(0..<viewModel.onBoardItems.count, id: \.self){
                index in
                OnBoardContent(page: viewModel.onBoardItems[index])
                
            }
            
        }.tabViewStyle(.page(indexDisplayMode: .always))
        
        OnBoardScreen()
    }
    
}
