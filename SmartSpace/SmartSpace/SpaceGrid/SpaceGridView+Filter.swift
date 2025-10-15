//
//  SpaceGridView+Filter.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 15/10/25.
//

import SwiftUI

extension SpaceGridView {
    func makeFilter() -> some View {
        Menu {
            Button("Todos los tipos") { selectedFilter = "Todos los tipos" }
            Button("Espacio de trabajo") { selectedFilter = "Espacio de trabajo" }
            Button("Sala de reuniones") { selectedFilter = "Sala de reuniones" }
            Button("Almacenes") { selectedFilter = "Almacenes" }
            Button("Cámaras frigoríficas") { selectedFilter = "Cámaras frigoríficas" }
        } label: {
            HStack {
                Text(selectedFilter)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
    }
}
