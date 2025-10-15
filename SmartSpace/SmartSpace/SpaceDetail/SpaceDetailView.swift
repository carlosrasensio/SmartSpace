//
//  SpaceDetailView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

struct SpaceDetailView: View {
    
    // MARK: Internal Properties

    let space: SpaceItem
    
    // MARK: View

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Imagen grande
                Rectangle()
                    .fill(Color(.systemGray5))
                    .frame(height: 180)
                    .overlay(
                        Image(systemName: space.iconName)
                            .font(.system(size: 48))
                            .foregroundColor(.secondary)
                    )
                    .frame(height: 250)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(space.name)
                        .font(.title)
                        .bold()
                    
                    HStack {
                        Label(space.building, systemImage: "mappin.circle")
                        Spacer()
                        Text(space.category)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 40) {
                        VStack(alignment: .leading) {
                            Text("Temperatura")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(space.temperatureFormatted)
                                .font(.title2)
                                .bold()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Consumo")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(space.consumptionFormatted)
                                .font(.title2)
                                .bold()
                        }
                    }
                    
                    Divider()
                    
                    Text("Gráficas y detalles próximamente...")
                        .foregroundColor(.secondary)
                        .padding(.vertical)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

#Preview {
    SpaceDetailView(space: SpaceItem.mockItem)
}
