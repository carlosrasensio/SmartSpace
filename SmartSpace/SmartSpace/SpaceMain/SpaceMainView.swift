//
//  SpaceMainView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

struct SpaceMainView: View {
    
    // MARK: Private Properties

    @Environment(SpaceMainViewModel.self) private var viewModel
    
    @State private var searchText: String = ""
    @State private var selectedFilter: String = "Todos los tipos"
    
    private var filteredSpaces: [SpaceItem] {
        viewModel.getFilteredSpaces(selectedFilter: selectedFilter,
                                    searchText: searchText)
    }
    
    private let columns = [
        GridItem(.flexible(), spacing: Constants.spacing),
        GridItem(.flexible(), spacing: Constants.spacing)
    ]
    
    // MARK: View
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Constants.spacing) {
                    SearchBarView(searchText:$searchText)
                    
                    FilterMenuView(selectedFilter: $selectedFilter)
                                        
                    SpaceGridView(spaces: filteredSpaces)
                }
                .padding(.vertical, Constants.spacing)
                .padding(.horizontal, Constants.spacing)
            }
            .navigationTitle("Espacios")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await viewModel.loadSpaces()
            }
        }
    }
}

// MARK: Constants

private extension SpaceMainView {
    enum Constants {
        static let spacing: CGFloat = 16
    }
}

// MARK: Preview

#Preview {
    SpaceMainView()
        .environment(SpaceFactory.makeSpaceMainViewModel())
}
