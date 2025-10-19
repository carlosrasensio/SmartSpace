//
//  DailyData.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 20/10/25.
//

import Foundation

struct DailyData: Identifiable {
    let id = UUID()
    let date: Date
    let temperature: Double
    let consumption: Double
    
    static var mockData: [DailyData] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        return (0..<30).map { offset in
            let date = calendar.date(byAdding: .day, value: -offset, to: today)!
            let temp = 0 + Double.random(in: 0...10)
            let cons = 30 + Double.random(in: 0...50)
            
            return DailyData(date: date, temperature: temp, consumption: cons)
        }.reversed()
    }
}
