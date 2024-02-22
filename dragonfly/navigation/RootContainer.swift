//
//  RootView.swift
//  firefly
//
//  Created by Na Ran on 22/02/2024.
//

import SwiftUI

struct RootContainer: View {
    @ObservedObject var appRouter = AppRouter()

    var body: some View {
        NavigationStack(path: $appRouter.routes) {
            LoginScreen()
                .environmentObject(appRouter)
                .navigationDestination(for: Route.self) { path in
                    path.screen.environmentObject(appRouter)
                }
            }
    }
}

struct RootContainer_Previews: PreviewProvider {
    static var previews: some View {
        RootContainer()
    }
}
