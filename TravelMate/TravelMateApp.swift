//
//  TravelMateApp.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 16/04/2025.
//

import SwiftUI

@main
struct TravelMateApp: App {
    // Creamos la única fuente de verdad para la navegación aquí
    @StateObject private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            AppNavigation(router: router) {
                HomeView()
            }
            // Inyectamos el router para que @EnvironmentObject lo encuentre
            .environmentObject(router)
        }
    }
}
