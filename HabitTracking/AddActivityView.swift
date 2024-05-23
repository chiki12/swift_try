//
//  AddActivityView.swift
//  HabitTracking
//
//  Created by rachiki on 2024/05/01.
//

import SwiftUI

struct AddActivityView: View {
    var habits: Habits
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var times = 0
    
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        List{
                TextField("input the activity name", text: $name)
                TextField("times", value: $times, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
        }
        .toolbar {
            Button("Save") {
                let activity = Habit(name: name, times: times)
                habits.items.append(activity)
                dismiss()
            }
            if amountIsFocused {
                Button("Done") {
                    amountIsFocused = false
                }
            }
        }
    }
}

#Preview {
    AddActivityView(habits: Habits())
}
