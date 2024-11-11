//
//  Rulemark.swift
//  ChartsDemo
//
//  Created by Al Housseini, Ahmad on 11.11.24.
//

import SwiftUI
import Charts

struct Pollen : Identifiable {
    var source: String
    var startDate: Date
    var endDate: Date
    var id = UUID()

    init(startMonth: Int, numMonths: Int, source: String) {
        self.source = source
        let calendar = Calendar.autoupdatingCurrent
        self.startDate = calendar.date(from: DateComponents(year: 2020, month: startMonth, day: 1))!
        self.endDate = calendar.date(byAdding: .month, value: numMonths, to: startDate)!
    }
}

struct DepartmentProfit : Identifiable {
    var department: String
    var profit: Double
    var id = UUID()
}




struct Rulemark: View {
    
    var data: [Pollen] = [
        Pollen(startMonth: 1, numMonths: 9, source: "Trees"),
        Pollen(startMonth: 12, numMonths: 1, source: "Trees"),
        Pollen(startMonth: 3, numMonths: 8, source: "Grass"),
        Pollen(startMonth: 4, numMonths: 8, source: "Weeds")
    ]
    
    var data2: [DepartmentProfit] = [
        DepartmentProfit(department: "Production", profit: 15000),
        DepartmentProfit(department: "Marketing", profit: 8000),
        DepartmentProfit(department: "Finance", profit: 10000)
    ]
    
    var body: some View {
        VStack {
            Text("Show Range with Rule Marks")
            Chart(data) {
                RuleMark(
                    xStart: .value("Start Date", $0.startDate),
                    xEnd: .value("End Date", $0.endDate),
                    y: .value("Pollen Source", $0.source)
                )
            } .scaledToFit()
                .padding()
            Text("Annotate a chart with rule mark")
            Chart {
                ForEach(data2) {
                    BarMark(
                        x: .value("Department", $0.department),
                        y: .value("Profit", $0.profit)
                    )
                }
                RuleMark(y: .value("Break Even Threshold", 9000))
                    .foregroundStyle(.red)
            } .scaledToFit()
                .padding()
        }
    }
}
        
        


#Preview {
    Rulemark()
}
