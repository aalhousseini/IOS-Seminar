//
//  Barmark.swift
//  ChartsDemo
//
//  Created by Al Housseini, Ahmad on 11.11.24.
//

import SwiftUI
import Charts

struct ProfitByCategory:Identifiable {
    let department: String
    let profit: Double
    let productCategory: String
    var id = UUID()
}


let data: [ProfitByCategory] = [
    ProfitByCategory(department: "Production", profit: 4000, productCategory: "Gizmos"),
    ProfitByCategory(department: "Production", profit: 5000, productCategory: "Gadgets"),
    ProfitByCategory(department: "Production", profit: 6000, productCategory: "Widgets"),
    ProfitByCategory(department: "Marketing", profit: 2000, productCategory: "Gizmos"),
    ProfitByCategory(department: "Marketing", profit: 1000, productCategory: "Gadgets"),
    ProfitByCategory(department: "Marketing", profit: 5000, productCategory: "Widgets"),
    ProfitByCategory(department: "Finance", profit: 2000, productCategory: "Gizmos"),
    ProfitByCategory(department: "Finance", profit: 3000, productCategory: "Gadgets"),
    ProfitByCategory(department: "Finance", profit: 5000, productCategory: "Widgets")
]

struct Job :Identifiable{
    let job: String
    let start: Double
    let end: Double
    var id = UUID()
}

let dataJOB: [Job] = [
    Job(job: "Job 1", start: 0, end: 15),
    Job(job: "Job 2", start: 5, end: 25),
    Job(job: "Job 1", start: 20, end: 35),
    Job(job: "Job 1", start: 40, end: 55),
    Job(job: "Job 2", start: 30, end: 60),
    Job(job: "Job 2", start: 30, end: 60)
]


struct Barmark: View {
    var body: some View {
        VStack {
            Text("Stacked Bar Chart")
            Chart(data) {
                    BarMark(
                        x: .value("Category", $0.department),
                        y: .value("Profit", $0.profit)
                    ) .foregroundStyle(by: .value("Product Category", $0.productCategory))
            } .padding().scaledToFit()
            Text("Interval Bar Chart")
            Chart(dataJOB) {
                    BarMark(
                        xStart: .value("Start Time", $0.start),
                        xEnd: .value("End Time", $0.end),
                        y: .value("Job", $0.job)
                    )
                } .padding().scaledToFit()
                .frame(width:600 , height:300 )
            
            
            
        }
    }
}

#Preview {
    Barmark()
}
