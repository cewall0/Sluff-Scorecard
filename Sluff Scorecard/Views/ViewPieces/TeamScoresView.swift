//
//  TeamScoresView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/5/24.
//

import SwiftUI

struct TeamScoresView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router

    @State var teamBids: (team1Bids: Int, team2Bids: Int) = (0, 0)
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack{

                LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                    Text (String(game.team1TotalScore))
                    Text (String(game.team2TotalScore))
                }.font(.title)
                
            if game.gameOver == false {
                LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                    HStack{
                        Text("Team Bid: \(game.team1TotalBid)").foregroundColor(game.team1TotalBid <= 14 ? .black : .red)
                    }
                    HStack{
                        Text("Team Bid: \(game.team2TotalBid)").foregroundColor(game.team2TotalBid <= 14 ? .black : .red)
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
            } else if game.gameOver == true && game.winner == game.team1Name {
                LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                    HStack{
                        Text("Winner!")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                    }
                    HStack{
                        Text(" ")
                    }
                }.font(.headline)
            } else if game.gameOver == true && game.winner == game.team2Name {
                LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                    HStack{
                        Text(" ")
                    }
                    HStack{
                        Text("Winner!")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                    }
                }.font(.headline)
            } else {
                HStack{
                    Text("We have a tie!")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                }
            }
                
        }
    }
}


#Preview {
    TeamScoresView()
        .environment(Game())
}
