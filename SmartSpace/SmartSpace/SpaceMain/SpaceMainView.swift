//
//  SpaceMainView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

struct SpaceMainView: View {
    
    @Environment(SpaceGridViewModel.self) private var spaceGridViewModel
    
    // MARK: View
    
    var body: some View {
        TabView {
            SpaceGridView()
                .environment(spaceGridViewModel)
                .tabItem {
                    Label("Colección", systemImage: "square.grid.2x2")
                }
            
            SpaceMapView()
                .tabItem {
                    Label("Mapa", systemImage: "map")
                }
            
            SpaceTrackedView()
                .tabItem {
                    Label("Destacados", systemImage: "bookmark")
                }
        }
        .accentColor(.blue)
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

// MARK: Preview

#Preview {
    SpaceMainView()
}
