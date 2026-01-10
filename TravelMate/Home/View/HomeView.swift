//
//  HomeView.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 16/04/2025.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @EnvironmentObject var router: AppRouter
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            switch viewModel.state {
            case .loading:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .PrimaryButton))

            case .empty:
                VStack(spacing: 16) {
                    Image("ic_travel_mate")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)

                    Text(LocalizedStringKey("home.emptystate.title"))
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.TextPrimary)
                }

            case .success(let trips):
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(trips, id: \.self) { trip in
                            TravelCardView(trip: trip)
                        }
                    }
                    .padding(.horizontal)
                }

            case .error(let message):
                Text(message)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            }

            Spacer()

            PrimaryButton(title: NSLocalizedString("home.new.trip.button.title", comment: "")) {
                router.navigate(to: .newTrip)
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Background)
    }
}
