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
    
    init() {
           UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.systemRed
           UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray4
    }
    
    var body: some View{
        TabView{
            ForEach(0..<viewModel.onBoardItems.count, id: \.self){
                index in
                OnBoardContent(page: viewModel.onBoardItems[index])
                
            }
            
        }.tabViewStyle(.page(indexDisplayMode: .always))
        
    }
    
}
