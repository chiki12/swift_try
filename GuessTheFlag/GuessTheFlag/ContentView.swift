//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by rachiki on 2024/04/03.
//

import SwiftUI

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleText())
    }
}
struct FlagView: View {
    var text: String
    var body: some View {
        Image(text)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var count = 0
    @State private var restartGame = false
    
    @State private var animationAmount = [Double](repeating: 0.0, count: 11)
    @State private var blurAmount = [Double](repeating: 1.0, count: 11)
    @State private var selectedFlag = -1
    var body: some View {
        ZStack{
//                        LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
            RadialGradient(stops:[
                .init(color: Color(red:0.1, green:0.2, blue:0.45), location: 0.3),
                .init(color: Color(red:0.76, green:0.15, blue:0.26), location: 0.3)
            ],center:.top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the flag")
//                    .font(.largeTitle.bold())
//                    .foregroundStyle(.white)
                    .titleStyle()
                VStack(spacing: 15){
                    
                    VStack{
                        Text("Tap the flag of")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){number in
                        Button {
                            flagTapped(number)
                        } label: {
//                            Image(countries[number])
//                                .clipShape(.capsule)
//                                .shadow(radius: 5)
                            FlagView(text: countries[number])
                                .rotation3DEffect(
                                    .degrees(
                                        selectedFlag == number ? 360 : 0 ), axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity( selectedFlag == -1 ? 1 : (selectedFlag == number ? 1 : 0.25))
                                .scaleEffect( selectedFlag == -1 ? 1 : (selectedFlag == number ? 1 : 0.5))
//                                .rotation3DEffect(
//                                    .degrees(animationAmount[number]), axis: (x: 0, y: 1, z: 0)
//                                )
//                                .blur(radius: (blurAmount[number] - 1 ) * 2)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(Rectangle())
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Count: \(count)")
                    .foregroundStyle(.secondary)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("continue", action: askQuestion)
        } message: {
            Text("Your score is \(scoreTitle).")
        }
        .alert(scoreTitle, isPresented: $restartGame){
            Button("restart", action: restart)
        } message: {
            Text("Your score is \(scoreTitle).\n Your final score is \(score), now restart the game.")
        }
        .animation(.default, value: selectedFlag)
    }
    
    func flagTapped(_ number: Int){
        /*
        withAnimation(.spring(duration: 1, bounce: 0.5)){
            animationAmount[number] += 360
            blurAmount[(number + 1) % 3] += 1
            blurAmount[(number + 2) % 3] += 1
        }
        */
        selectedFlag = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else{
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        count += 1
        if count == 8 {
            restartGame = true
        }
        else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
//        animationAmount = [Double](repeating: 0.0, count: 11)
//        blurAmount = [Double](repeating: 1.0, count: 11)
        selectedFlag = -1
    }
    
    func restart() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        count = 0
        score = 0
//        animationAmount = [Double](repeating: 0.0, count: 11)
//        blurAmount = [Double](repeating: 1.0, count: 11)
        selectedFlag = -1
    }
}

/*
struct ContentView: View {
    @State private var showingAlert = false
    
    
    var body: some View {
        Button("Show alert"){
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert){
//            Button("OK"){}
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please read this.")
        }

        /*
        VStack(alignment: .leading){
//        HStack(spacing: 20){
            Spacer()
            Text("Hello, world!")
            Text("This is another text view.")
            Spacer()
            Spacer()
        }
         */
        /*
        ZStack{
//            Color(red:0.6, green: 0.2, blue: 0.5)
//                .frame(minWidth:200, maxWidth: .infinity, maxHeight: 200)
            VStack(spacing:0){
                Color.red
                Color.blue
            }
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
//        .background(.red)
//        .ignoresSafeArea()
        */
        
//        LinearGradient(colors:[.white, .black], startPoint: .top, endPoint: .bottom)
//        LinearGradient(stops:[
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55)
//        ], startPoint: .top, endPoint: .bottom)
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200  )
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red ], center: .center)
        /*
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.indigo.gradient)
        */
//        Button("Delete selection",role: .destructive, action: executeDelete)
        
        /*VStack{
            Button("Button 1"){}
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive){}
                .buttonStyle(.bordered)
            Button("Button 3"){}
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
            Button("Button 4", role: .destructive){}
                .buttonStyle(.borderedProminent)
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            Image(systemName: "pencil.circle")
                .foregroundStyle(.red)
                .font(.largeTitle)
         Button{
         print("Button was tapped")
     } label: {
         Label("Edit",systemImage: "pencil")
             .padding()
             .foregroundStyle(.white)
             .background(.red)
         }
        }
        */
    }
    
    func executeDelete() {
        print("Now deleting...")
    }
}
*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
