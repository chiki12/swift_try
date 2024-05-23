//
//  ContentView.swift
//  Bookworm
//
//  Created by rachiki on 2024/05/13.
//

import SwiftData
import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors: offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    @State private var rememberMe = false
    
    @AppStorage("notes1") private var notes1 = ""
    // doesnt store secure information
    
    @AppStorage("notes2") private var notes2 = ""
    
    var body: some View {
        NavigationStack{
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On": "Off")
            
            TextEditor(text: $notes1)
                .padding()
            
            
            TextField("Enter your text", text: $notes2, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            List(students) { student in
                Text(student.name)
            }
            
            .navigationTitle("Notes and Students")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
