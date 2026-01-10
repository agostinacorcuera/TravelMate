//
//  HomeViewModel.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 16/04/2025.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var state: HomeUIState = .loading

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
        fetchTrips()
    }

    func fetchTrips() {
        let request: NSFetchRequest<Trip> = Trip.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "startDate", ascending: true)]

        do {
            let result = try context.fetch(request)
            if result.isEmpty {
                state = .empty
            } else {
                state = .success(result)
            }
        } catch {
            state = .error("No se pudieron cargar los viajes.")
        }
    }
}

