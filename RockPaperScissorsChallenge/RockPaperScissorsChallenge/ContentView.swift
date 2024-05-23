//
//  ContentView.swift
//  RockPaperScissorsChallenge
//
//  Created by rachiki on 2024/04/08.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreTitle = "NULL"
    @State private var endTheGame = false
    @State private var score = 0
    @State private var count = 0
    @State private var winOrLose = Bool.random()
    @State private var playerAnswer = "✊"
    
    let totalCount = 10
    let choices = ["✊", "✋", "✌️"]
    
    var resultChoice: String {
        if winOrLose {
            return "win"
        } else{
            return "lose"
        }
    }
    
    @State private var rightChoice = Int.random(in: 0...2)
    
    var machineChoice: Int {
        let num = rightChoice
        if winOrLose{
            return num - 1 < 0 ? num + 2 : num - 1
        } else {
            return num + 1 > 2 ? num - 2 : num + 1
        }
    }
    
    var body: some View {
        ZStack{
            Color.yellow
                .ignoresSafeArea()
            VStack {
                VStack{
                    Text("You have to")
                    Text("\(resultChoice)")
                        .foregroundColor(.primary)
                        .font(.largeTitle)
                    HStack{
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("who play")
                    }
                    Text("\(choices[machineChoice])")
                        .font(.largeTitle)
                        .padding()
                        .background(.gray)
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                VStack(spacing: 15){
                    Text("your choice")
                    ForEach(0..<3){ number in
                        Button{
                            choiceTapped(number)
                        } label: {
                            Text(choices[number])
                                .font(.title)
                                .padding()
                                .background(.pink)
                                .clipShape(Circle())
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .background(.blue)
                VStack{
                        Text("Your answer is")
                    Text("\(scoreTitle)")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.red)
                    Text("Your score is \(score)")
                    Text("You have \(totalCount-count) times left")
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .background(.regularMaterial)
                .background(.green)
            }
            .padding()
        }
                    .alert(scoreTitle, isPresented: $endTheGame){
                        Button("Restart", action: restartGame)
                    } message: {
                        Text("Game over!! \n Your final score is \(score), now restart the game")
                    }
    }
    
    func choiceTapped(_ number: Int) {
        if number == rightChoice {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }
        count += 1
        if count == totalCount {
            endTheGame = true
        } else {
            askQuestion()
        }
    }
    
    func askQuestion() {
        rightChoice = Int.random(in: 0...2)
        winOrLose.toggle()
    }
    
    func restartGame() {
        rightChoice = Int.random(in: 0...2)
        winOrLose = Bool.random()
        count = 0
        score = 0
        scoreTitle = "NULL"
    }
    
    
}

#Preview {
    ContentView()
}
