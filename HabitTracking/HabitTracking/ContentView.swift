//
//  ContentView.swift
//  HabitTracking
//
//  Created by rachiki on 2024/05/01.
//

import SwiftUI

struct Habit: Identifiable, Codable, Hashable {
    var id = UUID()
    let name: String
    var times: Int
}

@Observable
class Habits: Codable {
    var items = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

struct ContentView: View {
    @State private var habits = Habits()
    
    var body: some View {
        NavigationStack {
            Text("List of activities")
            
            List{
                ForEach(habits.items) { habit in
                    NavigationLink(value: habit) {
                        Text(habit.name)
                            .foregroundStyle(.secondary)
                    }
                }
                .onDelete(perform: removeItems )
            }
            
            .toolbar {
                NavigationLink(value: "add") {
                    Text("ADD")
                }
            }
            .navigationDestination(for: Habit.self) { selection in
                ActivityView(habit: selection)
            }
            .navigationDestination(for: String.self) { selection in
                AddActivityView(habits: habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
