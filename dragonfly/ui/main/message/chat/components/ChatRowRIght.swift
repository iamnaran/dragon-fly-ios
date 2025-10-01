//
//  RealMessageLeft.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/29/25.
//

import SwiftUI

struct ChatRightRow: View {
    let message: MessageData
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Spacer()
            
            Text(message.text)
                .padding(10)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .frame(maxWidth: 250, alignment: .trailing)
            
            // Future: profile image (if you want self-avatar)
            Circle()
                .fill(Color.blue.opacity(0.8))
                .frame(width: 32, height: 32)
        }
        .padding(.horizontal, 4)
    }
}
