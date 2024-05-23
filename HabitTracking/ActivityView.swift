//
//  ActivityView.swift
//  HabitTracking
//
//  Created by rachiki on 2024/05/01.
//

import SwiftUI

struct ActivityView : View{
    var habit: Habit
    
//    @Binding var times: Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text(habit.name)
                .font(.title)
            Text("\(habit.times) times")
//            Stepper("\(times.formatted()) times", value: $times , step: 1)
        }
        .padding()
        .background(.yellow)
    }
}


#Preview {
    ActivityView(habit: Habit(name: "Dance", times: 0))
}
