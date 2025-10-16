//
//  SmartSpaceApp.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI

@main
struct SmartSpaceApp: App {
    
    // MARK: - Private Properties
    
    @State private var spaceContainerViewModel = SpaceFactory.makeSpaceContainerViewModel()

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            SpaceFactory.makeSpaceMainView()
                .environment(spaceContainerViewModel)
        }
    }
}
