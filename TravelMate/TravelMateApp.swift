//
//  TravelMateApp.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 16/04/2025.
//

import SwiftUI

@main
struct TravelMateApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
