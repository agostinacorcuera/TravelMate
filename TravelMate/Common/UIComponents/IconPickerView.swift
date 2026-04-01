//
//  IconPicker.swift
//  TravelMate
//
//  Created by Agostina Corcuera on 31/03/2026.
//

import SwiftUI

struct IconPickerView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedIcon: String
    
    let columns = [GridItem(.adaptive(minimum: 60))]
    
    var body: some View {
        NavigationView {
            // Aplicamos tu color de fondo principal a toda la pantalla
            ZStack {
                Color.Background.ignoresSafeArea()
                
                ScrollView {
                    ForEach(IconProvider.travelCategories) { category in
                        Section(header: Text(category.name)
                                            .font(.headline)
                                            // Tu color para los títulos de las categorías
                                            .foregroundColor(Color.TextPrimary)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal)
                                            .padding(.top, 10)) {
                            
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(category.icons, id: \.self) { icon in
                                    Image(systemName: icon)
                                        .font(.title)
                                        .frame(width: 50, height: 50)
                                        // Blanco si está seleccionado, tu TextPrimary si no
                                        .foregroundColor(selectedIcon == icon ? .white : Color.TextPrimary)
                                        // Tu PrimaryButton si está seleccionado, CardBackground si no
                                        .background(selectedIcon == icon ? Color.PrimaryButton : Color.SecondaryViolet)
                                        .cornerRadius(12)
                                        .onTapGesture {
                                            selectedIcon = icon
                                            dismiss()
                                        }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        }
                    }
                }
            }
            .navigationTitle("Selecciona un Icono")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cerrar") { dismiss() }
                }
            }
        }
        // Aplica tu color principal a los botones de navegación (como el de "Cerrar")
        .tint(Color.PrimaryButton)
    }
}
