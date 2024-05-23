//
//  ContentView.swift
//  Moonshot
//
//  Created by rachiki on 2024/04/21.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .toolbar{
                Button{
                    showingGrid.toggle()
                } label: {
                    Image(systemName: showingGrid ? "square.grid.2x2" : "list.bullet")
                }
            }
        }
        .navigationTitle("Moonshot")
        
        .background(.darkBackGround)
        .preferredColorScheme(.dark)
        
    }
        
}

/*

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
    ]
    
    var body: some View {
        NavigationStack{
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: layout) {
//                LazyVGrid(columns: layout) {
                    ForEach(0..<1000) {
                        Text("Item \($0)")
                    }
                }
            }
            
            
            Image("Example")
                .resizable()
            //            .scaledToFit()
                .scaledToFit()
            //            .frame(width:300, height: 300)
                .containerRelativeFrame(.horizontal) { size, Axis in
                    size * 0.8
                } // a frame that related to container size
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<100) {
                        CustomText(text: "Item \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            
            Button("Decode JSON") {
                let input = """
            {
                 "name": "Taylor Swift",
                 "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                 }
            }
            """
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                
                if let user = try? decoder.decode(User.self, from: data) {
                    print(user.address.street)
                }
            }
            
            
            NavigationLink{
                Text("Detail View")
            } label : {
                VStack {
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}
*/

#Preview {
    ContentView()
}
