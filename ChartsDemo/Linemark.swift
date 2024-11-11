//
//  AreaMark.swift
//  ChartsDemo
//
//  Created by Al Housseini, Ahmad on 10.11.24.
//

import SwiftUI
import Charts

struct MonthlyHoursOfSunshine : Identifiable {
    var city: String
    var date: Date
    var hoursOfSunshine: Double
    var id = UUID()

    init(city: String, month: Int, hoursOfSunshine: Double) {
          let calendar = Calendar.autoupdatingCurrent
          self.city = city
          self.date = calendar.date(from: DateComponents(year: 2024, month: month))!
          self.hoursOfSunshine = hoursOfSunshine
      }
}

struct Linemark: View {
    var data: [MonthlyHoursOfSunshine] = [
        MonthlyHoursOfSunshine(city: "Seattle", month: 1, hoursOfSunshine: 74),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 1, hoursOfSunshine: 196),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 2, hoursOfSunshine: 54),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 2, hoursOfSunshine: 156),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 3, hoursOfSunshine: 123),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 3, hoursOfSunshine: 221),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 4, hoursOfSunshine: 178),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 4, hoursOfSunshine: 265),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 5, hoursOfSunshine: 220),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 5, hoursOfSunshine: 303),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 6, hoursOfSunshine: 229),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 6, hoursOfSunshine: 331),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 7, hoursOfSunshine: 288),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 7, hoursOfSunshine: 372),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 8, hoursOfSunshine: 283),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 8, hoursOfSunshine: 350),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 9, hoursOfSunshine: 215),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 9, hoursOfSunshine: 297),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 10, hoursOfSunshine: 125),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 10, hoursOfSunshine: 225),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 11, hoursOfSunshine: 70),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 11, hoursOfSunshine: 175),
                
                MonthlyHoursOfSunshine(city: "Seattle", month: 12, hoursOfSunshine: 62),
                MonthlyHoursOfSunshine(city: "Cupertino", month: 12, hoursOfSunshine: 199)
    ]
    
    var body: some View {
        Text("Area Line")
        Chart(data) {
            LineMark(
                        x: .value("Month", $0.date),
                        y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                    )
                    .foregroundStyle(by: .value("City", $0.city))
            }
        .padding()
        .scaledToFit()
    }
}

#Preview {
    Linemark()
}
