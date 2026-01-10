//
//  AppRoute.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 04/01/2026.
//
import SwiftUI

enum AppRoute: Hashable {
    case home
    case newTrip
    case tripDetail(id: UUID)
}
