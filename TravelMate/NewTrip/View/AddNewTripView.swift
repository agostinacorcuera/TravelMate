//
//  AddNewTripView.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 18/04/2025.
//

import SwiftUI

struct NewTripView: View {
    @Environment(\.dismiss) var dismiss

    @State private var title: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()

    var body: some View {
        VStack(spacing: 24) {

            VStack(spacing: 16) {
                TextField(NSLocalizedString("newtrip.placeholder.title", comment: ""), text: $title)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal)

                VStack(alignment: .leading, spacing: 8) {
                    Text(NSLocalizedString("newtrip.start.date", comment: ""))
                        .font(.subheadline)
                        .foregroundColor(.TextPrimary)
                    
                    DatePicker("", selection: $startDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding(.horizontal)
                        
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(NSLocalizedString("newtrip.end.date", comment: ""))
                        .font(.subheadline)
                        .foregroundColor(.TextPrimary)
                    
                    DatePicker("", selection: $endDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding(.horizontal)
                        .tint(Color.red)
            
                }
            }
            .padding(24)

            Spacer()

            PrimaryButton(title: NSLocalizedString("newtrip.button.save", comment: "")) {
                // Guardar viaje
            }
            .padding(24)
        }
        .background(Color.Background.ignoresSafeArea())
    }
}

