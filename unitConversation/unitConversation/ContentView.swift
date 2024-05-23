//
//  ContentView.swift
//  unitConversation
//
//  Created by rachiki on 2024/04/01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var temprature: Double = 0
    @State private var typeOfConvert0 = 0
    @State private var typeOfConvert1 = 0
    @FocusState private var tempIsFocused: Bool
    
    let tempConversion = ["celsius", "Fahrenheit"]
    
    var cTemp: Double {
        if typeOfConvert0 == 0 {
            return temprature
        } else {
            return fTemp * 9 / 5 + 32
        }
    }
    
    var fTemp: Double {
        if typeOfConvert0 == 1 {
            return temprature
        } else {
            return (cTemp - 32) * 5 / 9
        }
    }
    
    var tempAfterConvert: Double {
        if typeOfConvert1 == 0 {
            return cTemp
        } else {
            return fTemp
        }
    }
    var body: some View {
        NavigationView {
            Form {
                Section("original temprature"){
                    TextField("temprature", value:$temprature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($tempIsFocused)
                    
                    Picker("type of temprature", selection: $typeOfConvert0){
                        ForEach(0..<2){
                            Text(tempConversion[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("temprature after conversion"){
                    Text(tempAfterConvert, format: .number)
                    
                    Picker("type of temprature", selection: $typeOfConvert1){
                        ForEach(0..<2){
                            Text(tempConversion[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("convert temprature")
            .toolbar {
                if tempIsFocused {
                    Button("Done") {
                        tempIsFocused = false
                    }
                }
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
