//
//  SmartSpaceApp.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI
import SwiftData

@main
struct SmartSpaceApp: App {
    
    // MARK: - Private Properties
    
    @State private var spaceContainerViewModel = SpaceFactory.makeSpaceContainerViewModel()
    @State private var spaceDetailViewModel = SpaceFactory.makeSpaceDetailViewModel()
    
    private var modelContainer: ModelContainer = {
        let schema = Schema([Space.self ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: modelConfiguration)
        } catch {
            fatalError("❌ [ERROR] The ModelContainer could not be created: \(error.localizedDescription)")
        }
    }()

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            SpaceFactory.makeSpaceMainView()
                .environment(spaceContainerViewModel)
                .environment(spaceDetailViewModel)
        }
        .modelContainer(modelContainer)
    }
}
