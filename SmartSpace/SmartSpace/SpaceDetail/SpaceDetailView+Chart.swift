//
//  SpaceDetailView+Chart.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 20/10/25.
//

import Charts
import SwiftUI

extension SpaceDetailView {
    var chartView: some View {
        VStack(alignment: .leading, spacing: 24) {
            makeChart(for: .temperature(0))
            makeChart(for: .consumption(0))
        }
        .padding()
    }
    
    private func makeChart(for sensorType: SensorVarible, data: [DailyData] = DailyData.mockData) -> some View {        
        VStack(alignment: .leading) {
            Text(sensorType.title)
                .font(.headline)
            
            Chart(data) { item in
                let yValue = {
                    switch sensorType {
                    case .temperature: item.temperature
                    case .consumption: item.consumption
                    }
                }()
                
                let yLabel = {
                    switch sensorType {
                    case .temperature: "Temperatura"
                    case .consumption: "Consumo"
                    }
                }()

                LineMark(
                    x: .value("Fecha", item.date),
                    y: .value(yLabel, yValue)
                )
                .foregroundStyle(.yellow)
                .symbol(.circle)
                .interpolationMethod(.catmullRom)
            }
            .frame(height: 200)
            .chartXAxis {
                AxisMarks(values: .stride(by: .day, count: 5)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.day().month())
                }
            }
        }
    }
}
