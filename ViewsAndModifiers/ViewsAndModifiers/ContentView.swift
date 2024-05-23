//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by rachiki on 2024/04/04.
//

import SwiftUI


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ ViewBuilder let content:( Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
                
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack{
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}
/*

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.indigo)
            .clipShape(.rect(cornerRadius: 10))
    }
}



struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing){
           content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    func watermarked(with text: String) -> some View{
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    @State private var useRedText = false
    /* view as property
     1.
     var spells: some View {
         VStack{
             Text("Lumos")
             Text("Obliviate")
         }
     }
     2.
     var spells: some View {
         Group{
             Text("Lumos")
             Text("Obliviate")
         }
     }
     3.(prefered but be wary)
     @ViewBuilder var spells: some View {
         Text("Lumos")
         Text("Obliviate")
     }
     */
    
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
        Text("Hello, world!")
            .titleStyle()
            .watermarked(with: "Hacking with Swift")
        VStack(spacing: 10){
            CapsuleText(text: "First")
            CapsuleText(text:"Second")
        }
        Button("Hello, world!"){
            useRedText.toggle()
        }
        .background(useRedText ? .red : .blue)
    }
}
// font() is an environment modifier, which means the Gryffindor text view can override it with a custom font.
// blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.

*/
#Preview {
    ContentView()
}
