//
//  ProductViewModel.swift
//  firefly
//
//  Created by Na Ran on 21/02/2024.
//

import Foundation
import SwiftData
import Combine

@MainActor
class ChatViewModel : ObservableObject{
    
    @Published var newMessageText: String = ""
    @Published var errorMessage: String?
    
    func sendMessage(chatId: String, modelContext: ModelContext) {
            guard !newMessageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }

            let message = MessageData(
                chatId: chatId,
                text: newMessageText,
                timestamp: Date(),
                isSentByMe: true
            )

            modelContext.insert(message)

            do {
                try modelContext.save()
                newMessageText = "" // clear text after sending
            } catch {
                print("❌ Failed to save message: \(error)")
            }
        }
    
    
}
