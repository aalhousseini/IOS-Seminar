//
//  Areamark.swift
//  ChartsDemo
//
//  Created by Al Housseini, Ahmad on 10.11.24.
//

import SwiftUI
import Charts

struct Food: Identifiable {
    let name: String
    let price: Double
    let date: Date
    let id = UUID()


    init(name: String, price: Double, year: Int) {
        self.name = name
        self.price = price
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: year))!
    }
}


struct Areamark: View {
    let cheeseburgerCost: [Food] = [
        .init(name: "Cheeseburger", price: 0.15, year: 1960),
        .init(name: "Cheeseburger", price: 0.20, year: 1970),
        // ...
        .init(name: "Cheeseburger", price: 1.10, year: 2020)
    ]
    let cheeseburgerCostByItem: [Food] = [
        .init(name: "Burger", price: 0.07, year: 1960),
        .init(name: "Cheese", price: 0.03, year: 1960),
        .init(name: "Bun", price: 0.05, year: 1960),
        .init(name: "Burger", price: 0.10, year: 1970),
        .init(name: "Cheese", price: 0.04, year: 1970),
        .init(name: "Bun", price: 0.06, year: 1970),
        // ...
        .init(name: "Burger", price: 0.60, year: 2020),
        .init(name: "Cheese", price: 0.26, year: 2020),
        .init(name: "Bun", price: 0.24, year: 2020)
    ]
    var body: some View {
        Text("Area Mark")
        VStack {
        
            Chart(cheeseburgerCostByItem) { cost in
                AreaMark(
                    x: .value("Date", cost.date),
                    y: .value("Price", cost.price)
                )
                .foregroundStyle(by: .value("Food Item", cost.name))
            } .padding()
                .scaledToFit()
            
            Chart(cheeseburgerCostByItem) { cost in
                AreaMark(
                    x: .value("Date", cost.date),
                    y: .value("Price", cost.price),
                    stacking: .normalized
                )
                .foregroundStyle(by: .value("Food Item", cost.name))
            } .padding()
                .scaledToFit()
            
            Chart(cheeseburgerCostByItem) { cost in
                AreaMark(
                    x: .value("Date", cost.date),
                    y: .value("Price", cost.price),
                    stacking: .center
                )
                .foregroundStyle(by: .value("Food Item", cost.name))
            } .padding()
                .scaledToFit()
             

            
        }
    }
}

#Preview {
    Areamark()
}
