//
//  AddNewTripView.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 18/04/2025.
//

import SwiftUI

struct NewTripView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext

    @State private var iconName: String = "airplane" // Icono por defecto
    @State private var showingIconPicker = false
    @State private var title: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // Bloque 1: Título
                    FormFieldBlock(title: NSLocalizedString("newtrip.textfield.title", comment: "")) {
                        HStack(spacing: 12) {
                            // TextField para el nombre
                            TextField(NSLocalizedString("newtrip.placeholder.text", comment: ""), text: $title)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(12)
                            
                            // Botón del IconPicker
                            Button(action: {
                                showingIconPicker = true
                            }) {
                                Image(systemName: iconName)
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                                    .background(Color.PrimaryButton) // Usando tu color
                                    .cornerRadius(12)
                            }
                            .sheet(isPresented: $showingIconPicker) {
                                IconPickerView(selectedIcon: $iconName)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    // Bloque 2: Fecha Inicio (Icono - Texto - Date Picker)
                    DatePicker(selection: $startDate, displayedComponents: .date) {
                        HStack {
                            Image(systemName: "airplane.departure") // Icono fijo de inicio
                                .foregroundColor(Color.PrimaryButton)
                            Text(NSLocalizedString("newtrip.start.date", comment: ""))
                                .foregroundColor(Color.TextPrimary)
                        }
                    }
                    .datePickerStyle(.compact)
                    .tint(Color.PrimaryButton)
                    
                    Spacer()
                    
                    // Bloque 3: Fecha Fin (Icono - Texto - Date Picker)
                    DatePicker(selection: $endDate, displayedComponents: .date) {
                        HStack {
                            Image(systemName: "airplane.arrival") // Icono fijo de fin
                                .foregroundColor(Color.PrimaryButton)
                            Text(NSLocalizedString("newtrip.end.date", comment: ""))
                                .foregroundColor(Color.TextPrimary)
                        }
                    }
                    .datePickerStyle(.compact)
                    .tint(Color.PrimaryButton)
                }
                .padding(24)
            }
            
            Spacer()
            
            PrimaryButton(title: NSLocalizedString("button.save", comment: "")) {
                saveTrip()
            }
            .padding(24)
        }
        .background(Color.gray.opacity(0.1).ignoresSafeArea())
    }
    
    private func saveTrip() {
        let newTrip = Trip(context: viewContext)
        newTrip.title = title
        newTrip.startDate = startDate
        newTrip.endDate = endDate
        
        // 2. Ahora guardamos el icono seleccionado en lugar del valor por defecto
        newTrip.iconName = iconName
        
        do {
            try viewContext.save()
            dismiss() // Cierra la pantalla al guardar exitosamente
        } catch {
            let nsError = error as NSError
            print("Error al guardar el viaje: \(nsError), \(nsError.userInfo)")
        }
    }
}

struct FormFieldBlock<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color.TextPrimary)
                
            
            content
        }
    }
}
