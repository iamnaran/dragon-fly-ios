//
//  Product.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import SwiftUI
import _SwiftData_SwiftUI

// MARK: - Chat Screen
struct ChatScreen: View {
    let productId: String
    let productTitle: String
    
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = ChatViewModel()
    @FocusState private var isTextFieldFocused: Bool
    
    
    var body: some View {
        VStack(spacing: 0) {
            MessagesList(productId: productId)
            
            MessageInputBar(productId: productId, viewModel: viewModel).focused($isTextFieldFocused)
        }
        .navigationTitle(productTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            // Automatically show keyboard on appear
            DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
                isTextFieldFocused = true
            }
        }
        .onDisappear {
            // Hide keyboard on back
            isTextFieldFocused = false
        }
    }
}


// MARK: - Messages List
struct MessagesList: View {
    let productId: String
    @Environment(\.modelContext) private var modelContext
    @Query private var messages: [MessageData]
    
    init(productId: String) {
        self.productId = productId
        _messages = Query(
            filter: #Predicate<MessageData> { $0.chatId == productId },
            sort: [SortDescriptor(\MessageData.timestamp, order: .forward)]
        )
    }
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            List {
                ForEach(messages) { message in
                    Group {
                        if message.isSentByMe {
                            ChatRightRow(message: message)
                        } else {
                            ChatLeftRow(message: message)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .id(message.id)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .onAppear {
                scrollToBottom(scrollProxy)
            }
            .onChange(of: messages.count) {
                withAnimation(.easeOut(duration: 0.25)) {
                    scrollToBottom(scrollProxy)
                }
            }
        }
    }
    
    private func scrollToBottom(_ proxy: ScrollViewProxy) {
        guard let lastId = messages.last?.id else { return }
        proxy.scrollTo(lastId, anchor: .bottom)
    }
}

// MARK: - Message Input Bar
struct MessageInputBar: View {
    let productId: String
    @ObservedObject var viewModel: ChatViewModel
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
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
    }
}



struct ChatRow: View, Equatable {
    let message: MessageData
    
    static func == (lhs: ChatRow, rhs: ChatRow) -> Bool {
        lhs.message.id == rhs.message.id
    }
    
    var body: some View {
        if message.isSentByMe {
            ChatRightRow(message: message)
        } else {
            ChatLeftRow(message: message)
        }
    }
}


struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen(productId: "1", productTitle: "Message")
    }
}
