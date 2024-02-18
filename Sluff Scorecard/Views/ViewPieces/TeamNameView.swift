//
//  TeamNameView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/3/24.
//

import SwiftUI


struct TeamNameView: View {
    
    @Environment(Game.self) private var game
    
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        @Bindable var game = game

        VStack{
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
    
                    TextField(game.team1Name, text: $game.team1Name)
                    .multilineTextAlignment(.center)
                    .background(.blue.opacity(0.3))
                    .foregroundStyle(.black)
                    .cornerRadius(8)
                    .padding(.leading, 6.0)
                    .padding(.trailing, -4.0)
            

                    
                    TextField(game.team2Name, text: $game.team2Name)
                    .foregroundStyle(.black).opacity(1.0)
                    .multilineTextAlignment(.center)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(8)
                    .padding(.trailing, 6.0)
                    .padding(.leading, -4.0)

                    
                    
                
            }.font(.title) // end LazyVGrid
        }
    }
}

#Preview {
    TeamNameView()
        .environment(Game())
}
