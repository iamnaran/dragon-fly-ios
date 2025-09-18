//
//  LearningScreen.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/5/25.
//

import SwiftUI

struct LearningScreen: View {
    
    @ObservedObject var viewModel: LearningViewModel

    var body: some View {
        VStack{
            Text(" Count: \(viewModel.count)")
            AppButton(config: .init(text: "Increase", action: {
                viewModel.count += 1
            }))
        }
    }
    
}

#Preview{
    
    LearningScreen(viewModel: LearningViewModel())
    
}





