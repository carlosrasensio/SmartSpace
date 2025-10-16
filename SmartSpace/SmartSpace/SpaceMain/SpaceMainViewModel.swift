//
//  SpaceMainViewModel.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import Foundation

@Observable
final class SpaceMainViewModel {
    
    // MARK: Internal Properties
    
    var spaces: [SpaceItem] = []
    
    // MARK: Internal Functions

    func loadSpaces() async {
        try? await Task.sleep(nanoseconds: 500_000_000)
        spaces = SpaceItem.mockItems
    }
    
    func getFilteredSpaces(selectedFilter: String, searchText: String) -> [SpaceItem] {
        spaces.filter {
            (searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)) &&
            (selectedFilter == "Todos los tipos" || $0.category == selectedFilter)
        }
    }
}
