//
//  SpaceTrackedViewModel.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import Foundation

@Observable
final class SpaceTrackedViewModel {
    var trackedSpaces: [SpaceItem] = []
    
    func loadTrackedSpaces() async {
        try? await Task.sleep(nanoseconds: 500_000_000)
        trackedSpaces = SpaceItem.mockItems.filter { $0.isTracked }
    }
}

