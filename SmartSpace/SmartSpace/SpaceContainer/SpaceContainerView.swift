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
    
    private var filteredSpaces: [SpaceItem] {
        viewModel.getFilteredSpaces(mode: mode,
                                    selectedFilter: selectedFilter,
                                    searchText: searchText)
    }
    
    // MARK: Internal Properties

    let mode: SpaceContainerMode

    // MARK: View

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Constants.spacing) {
                    SearchBarView(searchText: $searchText,
                                  placeholder: mode.searchPlaceholder)

                    if mode.showFilter {
                        FilterMenuView(selectedFilter: $selectedFilter)
                    }

                    SpaceGridView(spaces: filteredSpaces)
                }
                .padding(.vertical, Constants.spacing)
                .padding(.horizontal, Constants.spacing)
            }
            .navigationTitle(mode.title)
            .navigationBarTitleDisplayMode(.large)
            .task {
                await viewModel.loadSpaces(for: mode)
            }
        }
    }
}

// MARK: - Constants

private extension SpaceContainerView {
    enum Constants {
        static let spacing: CGFloat = 16
    }
}

// MARK: - Preview

#Preview("All Spaces") {
    SpaceContainerView(mode: .all)
        .environment(SpaceContainerViewModel())
}

#Preview("Tracked Spaces") {
    SpaceContainerView(mode: .tracked)
        .environment(SpaceFactory.makeSpaceContainerViewModel())
}
