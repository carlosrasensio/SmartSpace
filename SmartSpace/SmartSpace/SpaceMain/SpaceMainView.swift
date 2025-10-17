//
//  SpaceMainView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 16/10/25.
//

import SwiftUI

struct SpaceMainView: View {
    
    @Environment(SpaceContainerViewModel.self) private var viewModel
    
    // MARK: View
    
    var body: some View {
        TabView {
            SpaceContainerView(config: .allSpaces)
                .environment(viewModel)
                .tabItem {
                    Label("Colección", systemImage: "square.grid.2x2")
                }
            
            SpaceMapView()
                .tabItem {
                    Label("Mapa", systemImage: "map")
                }
            
            SpaceContainerView(config: .trackedSpaces)
                .environment(viewModel)
                .tabItem {
                    Label("Destacados", systemImage: "bookmark")
                }
        }
        .accentColor(.blue)
    }
}

// MARK: - Preview

#Preview {
    SpaceMainView()
        .environment(SpaceContainerViewModel())
}
