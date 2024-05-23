//
//  ContentView.swift
//  BetterRest
//
//  Created by rachiki on 2024/04/09.
//

import CoreML
import SwiftUI

struct ContentView: View {
//    @State private var wakeUp = Date.now
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var errorOn = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var resultTitle: String{
        if errorOn {
            return "Error"
        }
        else {
            return "Your ideal bedtime is ..."
        }
    }
    
    var calculateBedTime : String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            errorOn = false
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Sorry, there was a problem calculating your bedtime"
        }
    }
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                                    VStack(alignment: .leading, spacing: 0){
                                        Text("When do you want to wake up?")
                                            .font(.headline)
                    
                                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                            .labelsHidden()
                                    }
//                    Section("When do you want to wake up?"){
//                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                            .labelsHidden()
//                    }
                    
                                    VStack(alignment: .leading, spacing: 0){
                                        Text("Desired amount of sleep")
                                            .font(.headline)
                    
                                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                                    }
//                    Section("Desired amount of sleep"){
//                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//                    }
                    
                    //                VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Text("Daily coffee intake")
                            .font(.headline)
                        
                        //                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                        Picker("Daily coffee intake", selection: $coffeeAmount){
                            ForEach(0..<21) { number in
                                Text("^[\(number) cup](inflect: true)")
                            }
                        }
                        .labelsHidden()
                        //                Section("Daily coffee intake") {
                        //                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 0...20, step: 1)
                        //                    }
                    }
                }
                .padding()
                
                Spacer()
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    Text(resultTitle)
                        .font(.title)
                        .foregroundStyle(.red)
                    Text(calculateBedTime)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                .frame(maxWidth: .infinity)
                .background(.yellow)
                
            }
            .navigationTitle("BetterRest")
            //            .toolbar {
            //                Button("Calculate", action: calculateBedtime)
            //            }
            //            .alert(alertTitle, isPresented: $showingAlert){
            //                Button("OK") {}
            //            } message: {
            //                Text(alertMessage)
            //            }
            
            Spacer()
        }
        .padding()
    }
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        
//        showingAlert = true
    }
    


}
/*
 // project one: Stepper
 
 struct ContentView: View {
     @State private var sleepAmount = 8.0
     var body: some View {
         Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.5)
     }
 }
 
 */
/*
// DatePicker & working with dates
struct ContentView: View {
    @State private var wakeUp = Date.now
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, /*displayedComponents: .hourAndMinute*/ in: Date.now...)
            .labelsHidden() // so you can still have VoiceOver description
        
        Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now.formatted(date: .long, time:.shortened))
    }
    
    func exampleDates() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
    }
    func exampleDates_1() {
        //        var components = DateComponents()
        //        components.hour = 8
        //        components.minute = 0
        //        let date = Calendar.current.date(from: components) ?? .now
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}
*/
/*
create ML
 XCode -> open developor tool ->
  create ML
 
how to train again: duplicate model source and train gain (with different algorithm)
 */

#Preview {
    ContentView()
}
