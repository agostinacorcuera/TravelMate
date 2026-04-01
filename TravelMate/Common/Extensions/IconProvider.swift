//
//  IconProvider.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 31/03/2026.
//
import Foundation

// Estructura para agrupar iconos
struct IconCategory: Identifiable {
    let id = UUID()
    let name: String
    let icons: [String]
}

// Proveedor de datos (Aquí puedes agregar todos los que quieras)
struct IconProvider {
    static let travelCategories: [IconCategory] = [
        IconCategory(name: "Transporte", icons: [
            "airplane", "airplane.departure", "airplane.arrival", "car", "car.fill",
            "bus", "bus.doubledecker", "tram", "train.side.front.car", "bicycle",
            "scooter", "fuelpump", "sailboat"
        ]),
        IconCategory(name: "Alojamiento y Lugares", icons: [
            "house", "building.2", "building.columns", "tent", "bed.double",
            "signpost.right", "map", "mappin.and.ellipse", "parkingsign"
        ]),
        IconCategory(name: "Naturaleza y Clima", icons: [
            "mountain.2", "tree", "leaf", "sun.max", "cloud.sun",
            "snowflake", "thermometer.sun", "water.waves", "drop"
        ]),
        IconCategory(name: "Actividades y Objetos", icons: [
            "suitcase", "suitcase.cart", "bag", "camera", "ticket",
            "creditcard", "banknote", "fork.knife", "cup.and.saucer",
            "wineglass", "popcorn", "figure.walk", "figure.pool.swim"
        ])
    ]
}
