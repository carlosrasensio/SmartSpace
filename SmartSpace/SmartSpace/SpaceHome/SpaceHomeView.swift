//
//  SpaceHomeView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 16/10/25.
//

import SwiftUI

struct SpaceHomeView: View {
    
    @Environment(SpaceMainViewModel.self) private var spaceMainViewModel
    
    // MARK: View
    
    var body: some View {
        TabView {
            SpaceMainView()
                .environment(spaceMainViewModel)
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
    SpaceHomeView()
}
