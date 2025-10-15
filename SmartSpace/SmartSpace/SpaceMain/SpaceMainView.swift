//
//  SpaceMainView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

struct SpaceMainView: View {
    var body: some View {
        TabView {
            SpaceGridView()
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

#Preview {
    SpaceMainView()
}
