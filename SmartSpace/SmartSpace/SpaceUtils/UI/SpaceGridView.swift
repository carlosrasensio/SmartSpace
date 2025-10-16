//
//  SpaceGridView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

struct SpaceGridView: View {
    
    // MARK: Internal Properties
    
    let spaces: [SpaceItem]
    
    // MARK: Private Properties
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: Constants.spacing),
        GridItem(.flexible(), spacing: Constants.spacing)
    ]
    
    // MARK: View

    var body: some View {
        LazyVGrid(columns: columns, spacing: Constants.spacing) {
            ForEach(spaces) { space in
                NavigationLink(destination: SpaceDetailView(space: space)) {
                    SpaceCardView(space: space)
                }
                .buttonStyle(PlainButtonStyle())
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
