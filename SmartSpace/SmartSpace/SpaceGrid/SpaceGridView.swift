//
//  SpaceGridView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

struct SpaceGridView: View {
    
    // MARK: Private Properties

    @Environment(SpaceGridViewModel.self) private var viewModel
    
    @State private var searchText: String = ""
    @State private var selectedFilter: String = "Todos los tipos"
    
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
                    
                    LazyVGrid(columns: columns, spacing: Constants.spacing) {
                        let filteredSpaces = viewModel.getFilteredSpaces(selectedFilter: selectedFilter,
                                                                         searchText: searchText)
                        
                        ForEach(filteredSpaces) { space in
                            NavigationLink(destination: SpaceDetailView(space: space)) {
                                SpaceCardView(space: space)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.bottom, Constants.spacing)
                }
                .padding(.horizontal, Constants.spacing)
                .padding(.top, Constants.spacing)
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

private extension SpaceGridView {
    enum Constants {
        static let spacing: CGFloat = 16
    }
}

// MARK: Preview

#Preview {
    SpaceGridView()
}
