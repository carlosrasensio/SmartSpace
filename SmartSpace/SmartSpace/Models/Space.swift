//
//  Space.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import Foundation
import SwiftData

@Model
final class Space: Identifiable {
    @Attribute(.unique) var id: Int
    var name: String
    var building: String
    var category: String
    var temperature: Double
    var consumption: Double
    var iconName: String
    var isTracked: Bool
    
    init(id: Int,
         name: String,
         building: String,
         category: String,
         temperature: Double,
         consumption: Double,
         iconName: String,
         isTracked: Bool) {
        self.id = id
        self.name = name
        self.building = building
        self.category = category
        self.temperature = temperature
        self.consumption = consumption
        self.iconName = iconName
        self.isTracked = isTracked
    }
}

// MARK: - Mocks

extension Space {
    static var mockItem: Space {
        Space(
            id: 1,
            name: "Oficina Principal",
            building: "Edificio Norte",
            category: "Espacio de trabajo",
            temperature: 22.1,
            consumption: 45,
            iconName: "building.2",
            isTracked: true
        )
    }
    
    static var mockItems: [Space] {
        [
            Space(
                id: 1,
                name: "Oficina Principal",
                building: "Edificio Norte",
                category: "Espacio de trabajo",
                temperature: 22.1,
                consumption: 45,
                iconName: "building.2",
                isTracked: true
            ),
            Space(
                id: 2,
                name: "Sala de Conferencias",
                building: "Edificio Norte",
                category: "Sala de reuniones",
                temperature: 21.5,
                consumption: 32,
                iconName: "person.3",
                isTracked: true
            ),
            Space(
                id: 3,
                name: "Almacén 1",
                building: "Edificio Sur",
                category: "Almacenes",
                temperature: 4.2,
                consumption: 125,
                iconName: "shippingbox",
                isTracked: false
            ),
            Space(
                id: 4,
                name: "Cámara Frigorífica",
                building: "Edificio Sur",
                category: "Cámaras frigoríficas",
                temperature: -18.5,
                consumption: 87,
                iconName: "snowflake",
                isTracked: true
            ),
            Space(
                id: 5,
                name: "Zona de Carga",
                building: "Edificio Oeste",
                category: "Almacenes",
                temperature: 15.3,
                consumption: 62,
                iconName: "truck.box",
                isTracked: false
            ),
            Space(
                id: 6,
                name: "Laboratorio",
                building: "Edificio Norte",
                category: "Espacio de trabajo",
                temperature: 20.8,
                consumption: 78,
                iconName: "flask",
                isTracked: false
            )
        ]
    }
}
