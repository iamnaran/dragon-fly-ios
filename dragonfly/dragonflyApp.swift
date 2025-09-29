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
    
    // Static lazy container (created only once, on demand)
    static let container: ModelContainer = {
        do {
            let schema = Schema([ProductData.self])
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
