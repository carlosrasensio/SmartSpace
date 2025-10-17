//
//  SpaceFactory.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 15/10/25.
//

import Foundation

final class SpaceFactory {
    static func makeSpaceMainView() -> SpaceMainView {
        .init()
    }
    
    static func makeSpaceContainerViewModel() -> SpaceContainerViewModel {
        .init()
    }
    
    static func makeSpaceDetailViewModel() -> SpaceDetailViewModel {
        .init()
    }
}
