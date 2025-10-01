//
//  RealMessageLeft.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/29/25.
//

import SwiftUI

struct ChatLeftRow: View {
    let message: MessageData
    
    var body: some View {

        HStack(alignment: .bottom, spacing: 8) {
            
            Circle()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 32, height: 32)
            
            Text(message.text)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.primary)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .frame(maxWidth: 250, alignment: .leading)
            
            Spacer()
        }
        .padding(.horizontal, 4)
    }
}
