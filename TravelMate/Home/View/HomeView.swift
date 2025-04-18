//
//  HomeView.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 16/04/2025.
//

import SwiftUI
import TravelMateUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image("ic_travel_mate")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)

            Text(LocalizedStringKey("home.empty_state.title"))
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(.TextPrimary)

            Spacer()

            PrimaryButton(title: NSLocalizedString("home.new.trip.button.title", comment: "")) {
                //viewModel.didTapNewTrip()
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Background)
    }
}
