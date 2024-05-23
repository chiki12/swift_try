//
//  ContentView.swift
//  Navigation
//
//  Created by rachiki on 2024/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        /*
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden, for: .navigationBar)
            // but be careful when navigationbar is hidden it sometimes the contents go under system information
        }
         */
        
        
        NavigationStack {
            Text("Hello world!")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Tap Me"){
                            //
                        }
                    }
                }
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
        }
    }
}

/*

@Observable
class PathStore {
//    var path: [Int] {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
//            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
//                path = decoded
                path = NavigationPath(decoded)
                return
            }
        }
        
//        path = []
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        do {
//            let data = try JSONEncoder().encode(path)
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct DetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0, path: $pathStore.path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $pathStore.path)
                }
        }
    }
}

*/
/*

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
    
}

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path : $path) {
//            Button("Show 32") {
//                path = [32]
//            }
//            Button("Show 64") {
//                path.append(64)
//            }
//            Button("Show 32 then 64") {
//                path = [32, 64]
//            }
            List(0..<100){ i in
                NavigationLink("Select number \(i)", value: i)
            }
            List(0..<5){ i in
                NavigationLink("Select string \(i)", value: String(i))
            }
            .toolbar {
                Button("Push 556"){
                    path.append(556)
                }
                Button("Push hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
    }
}
 */

#Preview {
    ContentView()
}
