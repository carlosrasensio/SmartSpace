//
//  SpaceCardView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

struct SpaceCardView: View {
    
    // MARK: Internal Properties

    let space: SpaceItem
    
    // MARK: View

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .fill(Color(.systemGray5))
                .frame(height: 180)
                .overlay(
                    Image(systemName: space.iconName)
                        .font(.system(size: 48))
                        .foregroundColor(.secondary)
                )
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(space.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                
                HStack(spacing: 4) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(space.building)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                
                Text(space.category)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            .padding(12)
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
    }
}

// MARK: Preview

#Preview {
    SpaceCardView(space: SpaceItem.mockItem)
        .frame(width: 170)
        .padding()
}
