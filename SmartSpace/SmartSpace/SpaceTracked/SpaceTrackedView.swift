//
//  SpaceTrackedView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

struct SpaceTrackedView: View {
    
    // MARK: Private Properties
    
    @State private var viewModel = SpaceTrackedViewModel()
    @State private var searchText: String = ""
    
    // MARK: View
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Constants.spacing) {
                    SearchBarView(searchText: $searchText,
                        placeholder: "Buscar destacados...")
                    
                    SpaceGridView(spaces: filteredSpaces)
                }
                .padding(.horizontal, Constants.spacing)
                .padding(.vertical, Constants.spacing)
            }
            .navigationTitle("Destacados")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await viewModel.loadTrackedSpaces()
            }
        }
    }
    
    // MARK: Computed Properties
    
    private var filteredSpaces: [SpaceItem] {
        viewModel.trackedSpaces.filter { space in
            searchText.isEmpty || space.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}

// MARK: Constants

private extension SpaceTrackedView {
    enum Constants {
        static let spacing: CGFloat = 16
    }
}

// MARK: Preview

#Preview {
    SpaceTrackedView()
}
