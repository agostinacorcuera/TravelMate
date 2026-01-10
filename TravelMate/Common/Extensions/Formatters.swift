//
//  Formatters.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 19/04/2025.
//

import Foundation

enum Formatters {
    
    static let date: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "es_AR")
        return formatter
    }()
    
    static func formattedRange(start: Date?, end: Date?) -> String {
        guard let start = start, let end = end else {
            return "Sin fecha"
        }

        let startStr = date.string(from: start)
        let endStr = date.string(from: end)
        return "\(startStr) - \(endStr)"
    }
}
