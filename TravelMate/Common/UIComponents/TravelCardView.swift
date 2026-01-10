//
//  TravelCardView.swift
//  TravelMateUI
//
//  Created by Agostina Corcuera on 16/04/2025.
//

import SwiftUI

public struct TravelCardView: View {
    public let trip: Trip

    public init(trip: Trip) {
        self.trip = trip
    }

    private var icon: Image {
        if let name = trip.iconName, !name.isEmpty {
            return Image(name)
        } else {
            return Image(systemName: "ic_plane")
        }
    }

    private var formattedDateRange: String {
        Formatters.formattedRange(start: trip.startDate, end: trip.endDate)
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 12) {
            icon
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(trip.title ?? "")
                    .font(.headline)
                    .foregroundColor(.TextPrimary)

                Text(formattedDateRange)
                    .font(.subheadline)
                    .foregroundColor(.TextPrimary.opacity(0.7))
            }

            Spacer()
        }
        .padding()
        .background(Color.CardBackground)
        .cornerRadius(16)
    }
}
