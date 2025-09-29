//
//  Message.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/29/25.
//

import Foundation
import SwiftData

@Model
final class Message {
    @Attribute(.unique) var id: UUID
    var chatId: UUID            
    var text: String
    var timestamp: Date
    var isSentByMe: Bool

    init(
        id: UUID = UUID(),
        chatId: UUID,
        text: String,
        timestamp: Date = Date(),
        isSentByMe: Bool
    ) {
        self.id = id
        self.chatId = chatId
        self.text = text
        self.timestamp = timestamp
        self.isSentByMe = isSentByMe
    }
}


extension Message {
    /// Dummy sample messages for previews/testing
    static let sampleMessages: [Message] = {
        let chat1 = UUID()
        let chat2 = UUID()

        return [
            // Chat 1
            Message(chatId: chat1, text: "Hey, how are you?", timestamp: Date().addingTimeInterval(-3600), isSentByMe: false),
            Message(chatId: chat1, text: "I’m good, just working on SwiftData 🚀", timestamp: Date().addingTimeInterval(-3500), isSentByMe: true),
            Message(chatId: chat1, text: "Nice! Let’s catch up later.", timestamp: Date().addingTimeInterval(-3400), isSentByMe: false),

            // Chat 2
            Message(chatId: chat2, text: "Yo! Did you check the new iPhone?", timestamp: Date().addingTimeInterval(-7200), isSentByMe: true),
            Message(chatId: chat2, text: "Yeah, looks amazing 🔥", timestamp: Date().addingTimeInterval(-7100), isSentByMe: false),
            Message(chatId: chat2, text: "Thinking to upgrade soon!", timestamp: Date().addingTimeInterval(-7000), isSentByMe: true),
        ]
    }()
}
