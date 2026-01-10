//
//  AppRouter.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 04/01/2026.
//
import SwiftUI

final class AppRouter: ObservableObject {
    @Published var path: [AppRoute] = []
    
    // Navegar a una pantalla nueva
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    // Ir atrás
    func goBack() {
        path.removeLast()
    }
    
    // Volver a la raíz (Home)
    func popToRoot() {
        path.removeAll()
    }
}
