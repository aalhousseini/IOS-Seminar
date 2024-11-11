//
//  Rectanglemark.swift
//  ChartsDemo
//
//  Created by Al Housseini, Ahmad on 11.11.24.
//

import SwiftUI
import Charts

struct MatrixEntry:Identifiable {
    var id = UUID()
    var positive: String
    var negative: String
    var num: Double
}


struct Rectanglemark: View {
    var data: [MatrixEntry] = [
        MatrixEntry(positive: "+", negative: "+", num: 125),
        MatrixEntry(positive: "+", negative: "-", num: 10),
        MatrixEntry(positive: "-", negative: "-", num: 80),
        MatrixEntry(positive: "-", negative: "+", num: 1)
    ]
    

    
    var body: some View {
        VStack {
            
            Text("Rectangle Mark")
            Chart(data) {
                RectangleMark(
                    x: .value("Positive", $0.positive),
                    y: .value("Negative", $0.negative)
                )
                .foregroundStyle(by: .value("Number", $0.num))
            } .padding()
                .scaledToFit()
            
        }
    }
}

#Preview {
    Rectanglemark()
}
