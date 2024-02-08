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
    
                    TextField(game.team1Name, text: $game.team1Name).multilineTextAlignment(.center)
                    TextField(game.team2Name, text: $game.team2Name).multilineTextAlignment(.center)
                
            }.font(.title) // end LazyVGrid
        }
    }
}

#Preview {
    TeamNameView()
        .environment(Game())
}
