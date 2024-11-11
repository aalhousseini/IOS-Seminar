//
//  Sectormark.swift
//  ChartsDemo
//
//  Created by Al Housseini, Ahmad on 11.11.24.
//

import SwiftUI
import Charts



struct Sectormark: View {
    @State var data = [
        (name: "Cachapa", sales: 9631),
        (name: "Crêpe", sales: 6959),
        (name: "Injera", sales: 4891),
        (name: "Jian Bing", sales: 2506),
        (name: "American", sales: 1777),
        (name: "Dosa", sales: 625),
    ]
    var body: some View {
        VStack {
            Text("Donut Charts")
            Chart(data, id: \.name) { name, sales in
                    SectorMark(angle: .value("Value", sales))
                        .foregroundStyle(by: .value("Product category", name))
            } .scaledToFit().padding()
               
            Chart(data, id: \.name) { name, sales in
                    SectorMark(
                        angle: .value("Value", sales),
                        innerRadius: .ratio(0.618),
                        outerRadius: .inset(10),
                        angularInset: 1
                    )
                    .cornerRadius(4)
                    .foregroundStyle(by: .value("Product category", name))
                }.scaledToFit().padding()
                .onTapGesture {
                    data = data.shuffled()  // Shuffle data on tap
                } 
        }
    }
}

#Preview {
    Sectormark()
}
