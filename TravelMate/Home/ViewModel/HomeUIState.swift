//
//  HomeUIState.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 18/04/2025.
//

enum HomeUIState {
    case loading
    case empty
    case success([Trip])
    case error(String)
}
