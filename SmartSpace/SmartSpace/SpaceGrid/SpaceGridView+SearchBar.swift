//
//  SpaceGridView+SearchBar.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 15/10/25.
//

import SwiftUI

extension SpaceGridView {
    func makeSearchBar() -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("Buscar espacios...", text: $searchText)
                .autocorrectionDisabled()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
