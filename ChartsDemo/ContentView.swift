//
//  ContentView.swift
//  ChartsDemo
//
//  Created by Al Housseini, Ahmad on 10.11.24.
//

import SwiftUI


struct WelcomeView: View {
    @Binding var isWelcomeScreenShown: Bool  // Binding to change screen
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Welcome SwiftChart Demo!")
                    .font(.title)
                    .padding()
                Text("18.11.2024")
                    .font(.title)
                    .padding()
                Text("Tap anywhere to continue")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.4))
            .onTapGesture {
                withAnimation {
                    isWelcomeScreenShown = false  // Move to the next screen on tap
                }
            }
        }
    }
}

struct ChartListItem<Destination: View>: View {
    var destination: Destination
    var name: String
    var image: ImageResource
    
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100 , height:  100)
                    .shadow(color: .white, radius: 1)
                Text(name)
                    .fontWeight(.bold)
            }
        }
    }
}

struct ChartItem : Identifiable {
    var id = UUID()
    var name: String
    var imageName: ImageResource
    var destination : AnyView
}


struct ContentView: View {
    @State private var isWelcomeScreenShown = true
    @State var searchText =  ""
    
  


    var body: some View {
                if isWelcomeScreenShown {
                    WelcomeView(isWelcomeScreenShown: $isWelcomeScreenShown)
                }
                else {
        
        let items = [
            ChartItem(name: "Areamark", imageName: .area, destination: AnyView(Areamark())),
            ChartItem(name: "Linemark", imageName: .line, destination: AnyView(Linemark())),
                      ChartItem(name: "Pointmark", imageName: .point, destination: AnyView(Pointmark())),
                      ChartItem(name: "Rectanglemark", imageName: .rectangle, destination: AnyView(Rectanglemark())),
                      ChartItem(name: "Rulemark", imageName: .rulemark, destination: AnyView(Rulemark())),
                      ChartItem(name: "Barmark", imageName: .bar, destination: AnyView(Barmark())),
                      ChartItem(name: "Sectormark", imageName: .sector, destination: AnyView(Sectormark()))
        ]
        
        var filteredItems: [ChartItem] {
            if searchText.isEmpty {
                return items
            } else {
                return items.filter{
                    $0.name.lowercased().contains(searchText.lowercased())
                }
            }
        }
            
        NavigationStack {
            
            List (filteredItems) { item in
                ChartListItem(destination: item.destination, name:  item.name, image: item.imageName)
             
            } .navigationTitle("SWIFT Charts")
                .searchable(text: $searchText)
                .autocorrectionDisabled()
                .animation(.default,value: searchText)
        }
    }
    }
}

#Preview {
    ContentView()
}


