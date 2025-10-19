//
//  SpaceContainerMode.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 17/10/25.
//

import Foundation

enum SpaceContainerMode {
    case all, tracked

    var title: String { self == .all ? "Espacios" : "Destacados" }
    var searchPlaceholder: String { self == .all ? "Buscar espacios..." : "Buscar destacados..." }
    var showFilter: Bool { self == .all }
}
