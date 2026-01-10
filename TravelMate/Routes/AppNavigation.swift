//
//  AppNavigation.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 04/01/2026.
//

import SwiftUI

struct AppNavigation<Content: View>: View {
    @ObservedObject var router: AppRouter // Recibe el router del @main
    let content: Content

    init(router: AppRouter, @ViewBuilder content: () -> Content) {
        self.router = router
        self.content = content()
    }

    var body: some View {
        // Usamos el array tipado del router para el NavigationStack
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .newTrip:
                        NewTripView()
                    case .tripDetail(let id):
                       // TripDetailView(tripId: id)
                        NewTripView()
                    case .home:
                        HomeView()
                    }
                }
        }
    }
}
