//
//  ListLayout.swift
//  Moonshot
//
//  Created by rachiki on 2024/04/24.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]
    
    let astronauts: [String: Astronaut]
    
    
    var body: some View {
            List{
                ForEach(missions) { mission in
//                    NavigationLink {
//                        MissionView(mission: mission, astronauts: astronauts)
//                    } label: {
                    NavigationLink(value: mission) {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
//                            .background(.lightBackground)
                        }
//                        .listRowBackground(.lightBackground)
                    }
//                    .listRowBackground(.lightBackground)
                }
                
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(.darkBackGround)
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    return ListLayout(missions:missions , astronauts: astronauts)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
