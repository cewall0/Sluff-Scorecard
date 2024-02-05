////
////  ScorecardView.swift
////  Sluff Scorecard
////
////  Created by Chad Wallace on 1/1/24.
////
//
import Foundation
import SwiftUI
import Observation

struct ScorecardView: View {
    
    @Environment(Game.self) private var game
    @State var teamBids: (team1Bids: Int, team2Bids: Int) = (0, 0)
    
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var sixColumnGrid = [GridItem(.fixed(20)),GridItem(.flexible()), GridItem(.fixed(105))]
    
    var body: some View {
        
        NavigationView() {
        
            VStack{

            HStack{
                Spacer()
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                        .padding(.trailing)
                        .foregroundColor(.gray)
                    }
            }
            Text("Sluff Scorecard")
                .font(.system(size: 32))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.top, 10)
            
            TeamNameView(game: game)
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                Text (String(game.team1TotalScore))
                Text (String(game.team2TotalScore))
            }.font(.title)
            
            VStack{
                LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                    HStack{
                        Text("Team Bid: \(game.team1TotalBid)")
                    }
                    HStack{
                        Text("Team Bid: \(game.team2TotalBid)")
                    }
                }.font(.headline)
            }
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                HStack{
                    Text("Team Sluffs: ")
                    Text(String(game.team1TotalSluffs))
                }
                HStack{
                    Text("Team Sluffs: ")
                    Text(String(game.team2TotalSluffs))
                }
            }.font(.headline)
            
            List {
                ForEach(game.playersList.indices, id: \.self) { index in
                    HStack{
                        
                        PlayerNameView(game: game, playerIndex: index)
                        
                        BidPickerView(game: game, playerIndex: index, onBidChanged: {
                            game.setTeamBids(from: game.playersList)
                        }
                    )}
                }
            } // end List
        } // end VStack
            
        }
    }
}

#Preview {
    ScorecardView()
        .environment(Game())
}


