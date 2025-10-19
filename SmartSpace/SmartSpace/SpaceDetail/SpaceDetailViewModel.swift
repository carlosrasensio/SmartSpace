//
//  SpaceDetailViewModel.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import Foundation

@Observable
final class SpaceDetailViewModel {

    // MARK: - Internal Properties

    var isTracked: Bool = false
    var showTrackedToast: Bool = false
    
    // MARK: - Internal Functions
    
    func setupTrackedSpace(_ space: SpaceItem, trackedSpaces: [SpaceItem]) {
        isTracked = trackedSpaces.contains(where: { $0.id == space.id })
    }
    
    func toggleTrackedSpace() {
        isTracked.toggle()
        showTrackedToast = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showTrackedToast = false
        }
    }
}
