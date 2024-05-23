//
//  ContentView.swift
//  Edutainment
//
//  Created by rachiki on 2024/04/17.
//

import SwiftUI

/*
 Hints:

 You should generate all your questions as soon as your game starts, storing them as an array of questions.
 own Swift struct, Question, storing the text and the answer.
 When it comes to asking questions, use another state property called questionNumber or similar, which is an integer pointing at some position in your question array.
 You can get user input either using buttons on the screen, like a calculator, or using a number pad text field – whichever you prefer.
 If you intend to pass a closure into a view’s initializer for later use, Xcode will force you to mark it as @escaping. This means “will be used outside of the current method.”
 */

struct ContentView: View {
    @State private var gameSetting = true
    @State private var numberOfGames = 5 // segmented
    @State private var choicesOfNumber = [5, 10, 20]
    
    @State private var countingGame = 0
    @State private var endingGame = false
    
    @State private var multipleTable = 10 // Stepper to control
    
    @State private var result = 0 // initialize
    
    @State private var num1 = 0 // initialize
    @State private var num2 = 0 // initialize
    @State private var rightResult = 0
    
    @State private var resultStatement = "Unknown"
    @State private var score = 0
    @State private var showingResult = false
    
    //    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationView {
            if gameSetting {
                VStack {
                    VStack(alignment: .leading){
                        Text("answer the question below and press OK button once you decide")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.yellow)
                        HStack{
                            VStack{
                                HStack{
                                    Text("Decide the number of games")
                                    Picker("number of games", selection: $numberOfGames){
                                        ForEach(choicesOfNumber, id : \.self){
                                            Text($0, format: .number)
                                        }
                                    }
                                    .pickerStyle(.segmented)
                                }
                                .padding()
                                .background(.thinMaterial)
                                
                                VStack(alignment: .leading){
                                    Text("Select which multiplication tables you want to practice")
                                    Stepper("up to \(multipleTable)", value: $multipleTable, in: 2...12, step: 1)
                                }
                                .padding()
                                .background(.thinMaterial)
                                
                            }
                            
                            Button {
                                startGame()
                            } label: {
                                Text("OK")
                                    .foregroundStyle(.black)
                                    .font(.title)
                            }
                            .padding()
                            .background(.yellow)
                        }
                        .padding()
                        .background(.pink)
                    }
                }
                .navigationTitle("Edutainment")
            } else {
                VStack{
                    Spacer()
                    VStack{
                        Text("This is NO. \(countingGame) question")
                        Text("Type the answer of ")
                            .font(.title)
                        Text("\(num1) x \(num2)")
                            .font(.title)
                            .foregroundStyle(.red)
                        HStack {
                            Text("Enter your answer")
                            TextField("answer", value: $result, format: .number)
                            //                                .keyboardType(.decimalPad)
                            //                                .focused($amountIsFocused)
                                .padding()
                                .background(.thinMaterial)
                        }
                        .padding()
                        .background(.pink)
                        Button("submit"){
                            checkTheAnswer()
                        }
                        .foregroundStyle(.primary)
                        .padding()
                        .background(.green)
                    }
                    
                    
                    Spacer()
                    
                    Text("Your score is \(score) / \(countingGame)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .background(.thinMaterial)
                    
                    
                    Spacer()
                    
                    Button {
                        endGame()
                    } label: {
                        Text("End the game")
                    }
                    .padding()
                    .background(.red)
                    .foregroundStyle(.secondary)
                    
                    Spacer()
                }
                .alert(resultStatement, isPresented: $showingResult){
                    Button("continue", action: continueGame)
                } message: {
                    Text("Your answer was \(resultStatement)")
                }
                .alert(resultStatement, isPresented:$endingGame){
                    Button("restart", action: endGame)
                } message: {
                    Text("Your final score is \(score), now restart the game.")
                }
                //                .toolbar {
                //                    if amountIsFocused {
                //                        Button("Done") {
                //                            amountIsFocused = false
                //                        }
                //                    }
                //                }
                .navigationTitle("Edutainment")
            }
            
            //        when endingGame, end the game
            //        .alarm
        }
    }
    
    func startGame() {
        score = 0
        countingGame = 0
        resultStatement = "Unknown"
        num1 = Int.random(in: 2 ... multipleTable)
        num2 = Int.random(in: 2 ... multipleTable)
        rightResult = num1 * num2
        result = 0
        withAnimation{
            gameSetting.toggle()
        }
        countingGame = 0
    }
    func endGame() {
        withAnimation{
            gameSetting.toggle()
        }
        numberOfGames = 5
        multipleTable = 10
    }
    func checkTheAnswer() {
        if result == rightResult {
            resultStatement = "RIGHT. GOOD JOB!!!"
            score += 1
        } else {
            resultStatement = "WRONG. \(num1) x \(num2) was \(rightResult)!!!"
        }
        if countingGame + 1 > numberOfGames {
            endingGame = true
        } else {
            showingResult = true
        }
    }
    func continueGame() {
        countingGame += 1
        num1 = Int.random(in: 2 ... multipleTable)
        num2 = Int.random(in: 2 ... multipleTable)
        rightResult = num1 * num2
        result = 0
        showingResult = false
    }
}


#Preview {
    ContentView()
}
