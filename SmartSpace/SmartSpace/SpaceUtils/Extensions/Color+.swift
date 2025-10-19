//
//  Color+.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 17/10/25.
//

import SwiftUI

extension Color {
    static func colorForTemperature(_ temp: Double) -> Self {
        switch temp {
        case ...Thresholds.Temperature.cold:
            return Color.blue
        case Thresholds.Temperature.cold..<Thresholds.Temperature.comfortableLow:
            return Color.cyan
        case Thresholds.Temperature.comfortableLow...Thresholds.Temperature.comfortableHigh:
            return Color.green
        case (Thresholds.Temperature.comfortableHigh + 0.0001)..<Thresholds.Temperature.warm:
            return Color.yellow
        case Thresholds.Temperature.warm..<Thresholds.Temperature.hot:
            return Color.orange
        default:
            return Color.red
        }
    }
    
    static func colorForConsumption(_ consumption: Double) -> Self {
        switch consumption {
        case ...Thresholds.Consumption.low:
            return Color.green
        case (Thresholds.Consumption.low + 0.0001)...Thresholds.Consumption.moderate:
            return Color.yellow
        case (Thresholds.Consumption.moderate + 0.0001)...Thresholds.Consumption.high:
            return Color.orange
        default:
            return Color.red
        }
    }
}

// MARK: - Thresholds

private extension Color {
    enum Thresholds {
        enum Temperature {
            static let veryCold: Double = 5
            static let cold: Double = 18
            static let comfortableLow: Double = 18
            static let comfortableHigh: Double = 24
            static let warm: Double = 28
            static let hot: Double = 30
        }
        
        enum Consumption {
            static let low: Double = 100
            static let moderate: Double = 500
            static let high: Double = 1000
        }
    }
}
