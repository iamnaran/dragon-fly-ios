//
//  dragonflyApp.swift
//  dragonfly
//
//  Created by Na Ran on 22/02/2024.
//

import SwiftUI
import SwiftData

@main
struct dragonflyApp: App {
    
    static let container: ModelContainer = {
        do {
            let schema = Schema([ProductData.self, MessageData.self])
            return try ModelContainer(
                for: schema,
                configurations: [
                    ModelConfiguration(isStoredInMemoryOnly: false, allowsSave: true)
                ]
            )
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            RootContainer().modelContainer(dragonflyApp.container)
        }
    }
}
