//
//  AddView.swift
//  iExpense
//
//  Created by rachiki on 2024/04/20.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @FocusState private var amountIsFocused: Bool
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
//        NavigationStack {
            Form{
//                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "JPY"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                            }
                //            .navigationTitle("Add new expense")
                    .toolbar {
                        Button("Save") {
                            let item = ExpenseItem(name: name, type: type, amount: amount)
                            expenses.items.append(item)
                            dismiss()
                        }
                        if amountIsFocused {
                            Button("Done") {
                                amountIsFocused = false
                            }
                        }
                    }
                    .navigationTitle($name)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden()
        }
    }


#Preview {
    AddView(expenses: Expenses())
}
