//
//  SpaceContainerViewModel.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import Foundation

@Observable
final class SpaceContainerViewModel {
            
    // MARK: Internal Functions
    
    func getFilteredSpaces(spaces: [Space],
                           selectedFilter: String,
                           searchText: String,
                           mode: SpaceContainerMode) -> [Space] {
        spaces.filter { space in
            let matchesSearch = searchText.isEmpty || space.name.localizedCaseInsensitiveContains(searchText)
            let matchesFilter = (selectedFilter == "Todos los tipos") || (space.category == selectedFilter)
            // si estamos en tracked, asumimos que showFilter puede estar desactivado,
            // pero mantenemos la posibilidad de filtrar por si en el futuro se permite
            return matchesSearch && (mode == .tracked ? matchesSearch : matchesFilter)
        }
    }
}
