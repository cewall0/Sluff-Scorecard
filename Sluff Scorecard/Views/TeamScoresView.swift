//
//  TeamScoresView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/5/24.
//

import SwiftUI

struct TeamScoresView: View {
    
    @Environment(Game.self) private var game
    @State var teamBids: (team1Bids: Int, team2Bids: Int) = (0, 0)
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack{

                LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                    Text (String(game.team1TotalScore))
                    Text (String(game.team2TotalScore))
                }.font(.title)
                
                LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                    HStack{
                        Text("Team Bid: \(game.team1TotalBid)")
                    }
                    HStack{
                        Text("Team Bid: \(game.team2TotalBid)")
                    }
                }.font(.headline)
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                HStack{
                    Text("Team Sluffs: \(game.team1TotalSluffs)")
                }
                HStack{
                    Text("Team Sluffs: \(game.team2TotalSluffs)")
                }
            }.font(.headline)
        }
    }
}


#Preview {
    TeamScoresView()
        .environment(Game())
}
