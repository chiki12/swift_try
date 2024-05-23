//
//  ContentView.swift
//  iExpense
//
//  Created by rachiki on 2024/04/18.
//

import Observation
import SwiftUI

// has to have id property when add Identifiable
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()  {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            Spacer()
            Text("Business expense")
                .font(.title)
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(.gray)
            List {
                ForEach(expenses.items) {item in
                    if item.type == "Business" {
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: "USD"))
                                .foregroundStyle(item.amount < 10 ? .black : (item.amount > 100 ? .red : .blue))
                        }
                    }
                }
                .onDelete(perform: removeItems )
            }
            
            
            Text("Personal expense")
                .font(.title)
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(.gray)
            List {
                ForEach(expenses.items) {item in
                    if item.type == "Personal" {
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: "USD"))
                                .foregroundStyle(item.amount < 10 ? .black : (item.amount > 100 ? .red : .blue))
                        }
                    }
                }
                .onDelete(perform: removeItems )
            }
            
            .navigationTitle("iExpense")
            .toolbar {
//                Button("Add Expense", systemImage: "plus") {
//                    showingAddExpense = true
//                }
                NavigationLink("ADD", value: "add")
            }
//            .sheet(isPresented: $showingAddExpense, content: {
//                AddView(expenses: expenses)
//            })
            .navigationDestination(for: String.self) { selection in
                AddView(expenses: expenses)
            
            }
            
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

/*
@Observable
class User {
    
    var firstName = "Bilbo"
    var lastName = "Baggins"
    // for class, the values inside are changing
    // for struct, the whole struct change
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello, \(name)")
        Button("Dismiss"){
            dismiss()
        }
    }
}

// for archiving and unarchiving data
struct User1: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    
    @State private var user = User()
    
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    // is there is no default then the initial value is 0
    // it takes at least couple seconds to save the value
    
    @AppStorage("tapCount") private var tapCount = 0
    // easier to use AppStorage but is hard to store compplicate objects
    
    @State private var user1 = User1(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName)")
                
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
                // everytime when you type the whole struct changes
                
                
                
                Button("Show Sheet") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet, content: {
                    SecondView(name: "@rachiki")
                })
                
                List {
                    ForEach(numbers, id:\.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                Button("Tap Count: \(tapCount)") {
                    tapCount += 1
                    
//                    UserDefaults.standard.set(tapCount, forKey: "Tap")
                }
                
                
                Button("Save User"){
                    let encoder = JSONEncoder()
                    
                    if let data = try? encoder.encode(user1) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                }
            }
            .padding()
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}
 */

#Preview {
    ContentView()
}
