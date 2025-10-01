//
//  Product.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import SwiftUI
import _SwiftData_SwiftUI

struct ChatScreen: View {
    let productId: String
    let chatTitle: String
    
    
    @Environment(\.modelContext) private var modelContext
    @Query private var messages: [MessageData]
    @StateObject private var viewModel: ChatViewModel = ChatViewModel()
    @State private var newMessage: String = ""
    
    init(productId: String, chatTitle: String) {
        self.productId = productId
        self.chatTitle = chatTitle
        _messages = Query(filter: #Predicate<MessageData> { msg in
            msg.chatId == productId
        }, sort: [SortDescriptor(\.timestamp, order: .forward)])
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            // Messages list in the middle
            List {
                ForEach(messages) { message in
                    
                    if message.isSentByMe {
                        ChatRightRow(message: message)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                    }else {
                        ChatLeftRow(message: message)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                    }
                    
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            
            // Input field pinned at bottom
            HStack(spacing: 8) {
                TextField("Type a message", text: $viewModel.newMessageText, axis: .vertical)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .lineLimit(3)
                
                Button {
                    viewModel.sendMessage(chatId: productId, modelContext: modelContext)
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(.thinMaterial)
        }
        .navigationTitle(chatTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(chatTitle)
                    .font(.headline)
            }
        }
    }
    
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen(productId: "1", chatTitle: "Message")
    }
}
