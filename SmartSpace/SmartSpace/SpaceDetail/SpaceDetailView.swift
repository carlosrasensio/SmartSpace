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
                headerImage
                
                VStack(alignment: .leading, spacing: 16) {
                    title
                    description
                    
                    Divider()
                    
                    sensorVariables
                    
                    Divider()
                    
                    otherVariables
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Private Subviews

private extension SpaceDetailView {
    var headerImage: some View {
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
    }

    var title: some View {
        Text(space.name)
            .font(.title)
            .bold()
    }

    var description: some View {
        HStack {
            Label(space.building, systemImage: "mappin.circle")
            Spacer()
            Text(space.category)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    var sensorVariables: some View {
        HStack(spacing: 40) {
            makeSensorVariable(title: "Temperatura", value: space.temperatureFormatted)
            makeSensorVariable(title: "Consumo", value: space.consumptionFormatted)
        }
    }

    var otherVariables: some View {
        Text("Gráficas y detalles próximamente...")
            .foregroundColor(.secondary)
            .padding(.vertical)
    }

    func makeSensorVariable(title: String, value: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.title2)
                .bold()
        }
    }
}

// MARK: - Preview

#Preview {
    SpaceDetailView(space: SpaceItem.mockItem)
}
