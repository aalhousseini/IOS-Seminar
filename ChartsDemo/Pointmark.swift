//
//  Pointmark.swift
//  ChartsDemo
//
//  Created by Al Housseini, Ahmad on 11.11.24.
//

import SwiftUI
import Charts

struct Insect:Identifiable {
    let name: String
    let family: String
    let wingLength: Double
    let wingWidth: Double
    let weight: Double
    var id = UUID()
}

struct Pointmark: View {
    var data: [Insect] = [
        Insect(name: "Hepialidae", family: "Lepidoptera", wingLength: 61, wingWidth: 52, weight: 22),
        Insect(name: "Danaidae", family: "Lepidoptera", wingLength: 60, wingWidth: 48, weight: 24),
        Insect(name: "Riodinidae", family: "Lepidoptera", wingLength: 53, wingWidth: 43, weight: 18),
        
        Insect(name: "Papilionidae", family: "Lepidoptera", wingLength: 72, wingWidth: 60, weight: 25),
        Insect(name: "Nymphalidae", family: "Lepidoptera", wingLength: 65, wingWidth: 54, weight: 21),
        Insect(name: "Lycaenidae", family: "Lepidoptera", wingLength: 45, wingWidth: 35, weight: 15),
        
        Insect(name: "Formicidae", family: "Hymenoptera", wingLength: 10, wingWidth: 6, weight: 0.5),
        Insect(name: "Apidae", family: "Hymenoptera", wingLength: 12, wingWidth: 8, weight: 0.6),
        Insect(name: "Vespidae", family: "Hymenoptera", wingLength: 14, wingWidth: 9, weight: 0.7),
        
        Insect(name: "Scarabaeidae", family: "Coleoptera", wingLength: 30, wingWidth: 20, weight: 8),
        Insect(name: "Carabidae", family: "Coleoptera", wingLength: 28, wingWidth: 18, weight: 7),
        Insect(name: "Coccinellidae", family: "Coleoptera", wingLength: 15, wingWidth: 10, weight: 1.5),
        
        Insect(name: "Acrididae", family: "Orthoptera", wingLength: 25, wingWidth: 16, weight: 3),
        Insect(name: "Gryllidae", family: "Orthoptera", wingLength: 20, wingWidth: 14, weight: 2.5),
        Insect(name: "Tettigoniidae", family: "Orthoptera", wingLength: 32, wingWidth: 22, weight: 4)
    ]
    
    var body: some View {
        Text("Point Mark")
        Chart(data) {
                PointMark(
                    x: .value("Wing Length", $0.wingLength),
                    y: .value("Wing Width", $0.wingWidth)
                ).foregroundStyle(by: .value("Family", $0.family))
                .symbol(by: .value("Family", $0.family))
            }
        
        .padding()
        .scaledToFit()
    }
}

#Preview {
    Pointmark()
}
