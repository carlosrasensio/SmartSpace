//
//  SensorVarible.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 17/10/25.
//

import SwiftUI

enum SensorVarible {
    case temperature(_ value: Double)
    case consumption(_ value: Double)
    
    var title: String {
        switch self {
        case .temperature: "Temperature"
        case .consumption: "Consumption"
        }
    }
    
    private var value: String {
        switch self {
        case .temperature(let value): String(value)
        case .consumption(let value): String(value)
        }
    }
    
    var valueFormatted: String {
        switch self {
        case .temperature(let value): String(format: "%.1f°C", value)
        case .consumption(let value): String(format: "%.0f kW", value)
        }
    }
    
    var valueColor: Color {
        switch self {
        case .temperature(let value): Color.colorForTemperature(value)
        case .consumption(let value): Color.colorForConsumption(value)
        }
    }
}
