//
//  SpaceItem.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import Foundation
import SwiftData

@Model
final class SpaceItem: Identifiable {
    @Attribute(.unique) var id: Int
    var name: String
    var building: String
    var category: String
    var temperature: Double
    var consumption: Double
    var iconName: String
    var imageURL: String
    var isTracked: Bool
    
    init(id: Int,
         name: String,
         building: String,
         category: String,
         temperature: Double,
         consumption: Double,
         iconName: String,
         imageURL: String,
         isTracked: Bool) {
        self.id = id
        self.name = name
        self.building = building
        self.category = category
        self.temperature = temperature
        self.consumption = consumption
        self.iconName = iconName
        self.imageURL = imageURL
        self.isTracked = isTracked
    }
}

// MARK: - Mocks

extension SpaceItem {
    static var mockItem: SpaceItem {
        SpaceItem(
            id: 1,
            name: "Oficina Principal",
            building: "Edificio Norte",
            category: "Espacio de trabajo",
            temperature: 22.1,
            consumption: 45,
            iconName: "building.2",
            imageURL: "https://images.unsplash.com/photo-1497366216548-37526070297c?w=800",
            isTracked: true
        )
    }
    
    static var mockItems: [SpaceItem] {
        [
            SpaceItem(
                id: 1,
                name: "Oficina Principal",
                building: "Edificio Norte",
                category: "Espacio de trabajo",
                temperature: 22.1,
                consumption: 45,
                iconName: "building.2",
                imageURL: "https://images.unsplash.com/photo-1497366216548-37526070297c?w=800",
                isTracked: true
            ),
            SpaceItem(
                id: 2,
                name: "Sala de Conferencias",
                building: "Edificio Norte",
                category: "Sala de reuniones",
                temperature: 21.5,
                consumption: 32,
                iconName: "person.3",
                imageURL: "https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=800",
                isTracked: true
            ),
            SpaceItem(
                id: 3,
                name: "Almacén 1",
                building: "Edificio Sur",
                category: "Almacenes",
                temperature: 4.2,
                consumption: 125,
                iconName: "shippingbox",
                imageURL: "https://images.unsplash.com/photo-1553413077-190dd305871c?w=800",
                isTracked: false
            ),
            SpaceItem(
                id: 4,
                name: "Cámara Frigorífica",
                building: "Edificio Sur",
                category: "Cámaras frigoríficas",
                temperature: -18.5,
                consumption: 87,
                iconName: "snowflake",
                imageURL: "https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=800",
                isTracked: true
            ),
            SpaceItem(
                id: 5,
                name: "Zona de Carga",
                building: "Edificio Oeste",
                category: "Almacenes",
                temperature: 15.3,
                consumption: 62,
                iconName: "truck.box",
                imageURL: "https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?w=800",
                isTracked: false
            ),
            SpaceItem(
                id: 6,
                name: "Laboratorio",
                building: "Edificio Norte",
                category: "Espacio de trabajo",
                temperature: 20.8,
                consumption: 78,
                iconName: "flask",
                imageURL: "https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=800",
                isTracked: false
            )
        ]
    }
}
