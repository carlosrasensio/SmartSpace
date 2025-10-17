//
//  SpaceContainerViewModel.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import Foundation

@Observable
final class SpaceContainerViewModel {
    
    // MARK: Internal Properties
    
    var allSpaces: [SpaceItem] = []
    var trackedSpaces: [SpaceItem] = []
    
    // MARK: Internal Functions
    
    func loadSpaces(for mode: SpaceContainerMode) async {
        switch mode {
        case .all: await loadAllSpaces()
        case .tracked: await loadTrackedSpaces()
        }
    }
    
    func getFilteredSpaces(mode: SpaceContainerMode,
                           selectedFilter: String,
                           searchText: String) -> [SpaceItem] {
        let spaces = mode == .all ? allSpaces : trackedSpaces
        
        return spaces.filter { space in
            let matchesSearch = searchText.isEmpty ||
            space.name.localizedCaseInsensitiveContains(searchText)
            let matchesFilter = selectedFilter == "Todos los tipos" ||
            space.category == selectedFilter
            
            return matchesSearch && (mode == .tracked || matchesFilter)
        }
    }
    
    func toggleTracked(for space: SpaceItem) {
        // Por ahora, solo actualiza el array local
        if let index = trackedSpaces.firstIndex(where: { $0.id == space.id }) {
            trackedSpaces.remove(at: index)
        } else {
            trackedSpaces.append(space)
        }
    }
}

// MARK: Private Functions

private extension SpaceContainerViewModel {
    func loadAllSpaces() async {
        // Simula carga desde servicio
        try? await Task.sleep(nanoseconds: 500_000_000)
        allSpaces = SpaceItem.mockItems
    }
    
    func loadTrackedSpaces() async {
        // Simula carga desde servicio
        try? await Task.sleep(nanoseconds: 500_000_000)
        trackedSpaces = [SpaceItem.mockItem]
    }
}
