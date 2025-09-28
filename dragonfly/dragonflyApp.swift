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
    
    let container: ModelContainer

    
    init() {
        do {
            let schema = Schema([ProductData.self])
            
            container = try ModelContainer(
                for: schema,
                configurations: []
            )
            
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }
    
    
    var body: some Scene {
        WindowGroup {
            RootContainer()
        }.modelContainer(container)
    }
}
