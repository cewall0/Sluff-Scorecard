//
//  TeamNameView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/3/24.
//

import SwiftUI


struct TeamNameView: View {
    
    @Bindable var game: Game
    
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        VStack{
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
    
                    TextField(game.team1Name, text: $game.team1Name).multilineTextAlignment(.center)
                    TextField(game.team2Name, text: $game.team2Name).multilineTextAlignment(.center)
                
            }.font(.title) // end LazyVGrid
        }
    }
}

#Preview {
    TeamNameView(game: Game())
}
