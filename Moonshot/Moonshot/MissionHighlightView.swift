//
//  MissionHighlightView.swift
//  Moonshot
//
//  Created by rachiki on 2024/04/24.
//

import SwiftUI

struct MissionHighlightView: View {
    let mission: Mission
    
    var body: some View {
        VStack(alignment: .leading, content: {
            DividerView()
            
            Text("Mission Highlights")
                .font(.title.bold())
                .padding(.bottom, 5)
            
            Text(mission.description)
            
            DividerView()
            
            Text("Crew")
                .font(.title.bold())
                .padding(.bottom, 5)
        })
        .padding(.horizontal)
    }
}
