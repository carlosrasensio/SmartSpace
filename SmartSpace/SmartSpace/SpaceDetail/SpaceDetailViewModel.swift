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
    
    func toggleTracked() async {
        if isTracked {
            await removeTrackedSpace()
        } else {
            await saveTrackedSpace()
        }
        
        showTrackedToast = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showTrackedToast = false
        }
    }
}

// MARK: - Private Functions

private extension SpaceDetailViewModel {
    func saveTrackedSpace() async {
        isTracked = true
    }
    
    func removeTrackedSpace() async {
        isTracked = false
    }
}
