//
//  FilterMenuView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 15/10/25.
//

import SwiftUI

struct FilterMenuView: View {
    
    // MARK: Internal Properties
    
    @Binding var selectedFilter: String
    
    // MARK: Private Properties

    private let options: [String] = [
        "Todos los tipos",
        "Espacio de trabajo",
        "Sala de reuniones",
        "Almacenes",
        "Cámaras frigoríficas"
    ]
    
    // MARK: View

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selectedFilter = option
                }
            }
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
