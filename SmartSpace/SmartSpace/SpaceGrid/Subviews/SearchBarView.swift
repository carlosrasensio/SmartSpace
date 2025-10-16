//
//  SearchBarView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 15/10/25.
//

import SwiftUI

struct SearchBarView: View {
    
    // MARK: Internal Properties

    @Binding var searchText: String
    
    // MARK: View

    var body: some View {
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
