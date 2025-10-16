//
//  SpaceContainerView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

struct SpaceContainerView: View {
    
    // MARK: Private Properties
    
    @Environment(SpaceContainerViewModel.self) private var viewModel
    
    @State private var searchText: String = ""
    @State private var selectedFilter: String = "Todos los tipos"
    
    // MARK: Internal Properties
    
    let config: SpaceContainerConfiguration
    
    // MARK: View
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Constants.spacing) {
                    SearchBarView(
                        searchText: $searchText,
                        placeholder: config.searchPlaceholder
                    )
                    
                    if config.showFilter {
                        FilterMenuView(selectedFilter: $selectedFilter)
                    }
                    
                    SpaceGridView(spaces: filteredSpaces)
                }
                .padding(.vertical, Constants.spacing)
                .padding(.horizontal, Constants.spacing)
            }
            .navigationTitle(config.title)
            .navigationBarTitleDisplayMode(.large)
            .task {
                await viewModel.loadSpaces(for: config.mode)
            }
        }
    }
    
    // MARK: Computed Properties
    
    private var filteredSpaces: [SpaceItem] {
        viewModel.getFilteredSpaces(
            mode: config.mode,
            selectedFilter: selectedFilter,
            searchText: searchText
        )
    }
}

// MARK: Constants

private extension SpaceContainerView {
    enum Constants {
        static let spacing: CGFloat = 16
    }
}

// MARK: Configuration

struct SpaceContainerConfiguration {
    let mode: SpaceContainerMode
    let title: String
    let searchPlaceholder: String
    let showFilter: Bool
    
    static let allSpaces = SpaceContainerConfiguration(
        mode: .all,
        title: "Espacios",
        searchPlaceholder: "Buscar espacios...",
        showFilter: true
    )
    
    static let trackedSpaces = SpaceContainerConfiguration(
        mode: .tracked,
        title: "Destacados",
        searchPlaceholder: "Buscar destacados...",
        showFilter: false
    )
}

enum SpaceContainerMode {
    case all
    case tracked
}

// MARK: Preview

#Preview("All Spaces") {
    SpaceContainerView(config: .allSpaces)
        .environment(SpaceContainerViewModel())
}

#Preview("Tracked Spaces") {
    SpaceContainerView(config: .trackedSpaces)
        .environment(SpaceContainerViewModel())
}
