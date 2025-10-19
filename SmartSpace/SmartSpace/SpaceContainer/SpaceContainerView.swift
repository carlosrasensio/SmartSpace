//
//  SpaceContainerView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI
import SwiftData

struct SpaceContainerView: View {
    
    // MARK: Private Properties
    
    @Environment(SpaceContainerViewModel.self) private var viewModel
    @Query private var trackedSpaces: [Space]
    @State private var searchText: String = ""
    @State private var selectedFilter: String = "Todos los tipos"
    
    private var spaces: [Space] {
        viewModel.getFilteredSpaces(spaces: mode == .tracked ? trackedSpaces : Space.mockItems,
                                    selectedFilter: selectedFilter,
                                    searchText: searchText,
                                    mode: mode)
    }
    
    // MARK: Internal Properties

    let mode: SpaceContainerMode

    // MARK: View

    var body: some View {
        NavigationStack {
            Group {
                if spaces.isEmpty {
                    Text("No hay ningún espacio destacado")
                        .font(.title3)
                        .foregroundColor(.secondary)
                } else {
                    ScrollView {
                        VStack(spacing: Constants.spacing) {
                            SearchBarView(searchText: $searchText,
                                          placeholder: mode.searchPlaceholder)
                            
                            if mode.showFilter {
                                FilterMenuView(selectedFilter: $selectedFilter)
                            }
                            
                            SpaceGridView(spaces: spaces)
                        }
                        .padding(.vertical, Constants.spacing)
                        .padding(.horizontal, Constants.spacing)
                    }
                }
            }
            .navigationTitle(mode.title)
            .navigationBarTitleDisplayMode(.large)
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
