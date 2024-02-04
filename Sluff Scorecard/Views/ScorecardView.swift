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
    
    @Environment(AppState.self) private var appState
    @State var teamBids: (team1Bids: Int, team2Bids: Int) = (0, 0)
    
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var sixColumnGrid = [GridItem(.fixed(20)),GridItem(.flexible()), GridItem(.fixed(105))]
    
    var body: some View {
        
        VStack{
            
            Text("Sluff Scorecard")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 10)
            
            TeamNameView(appState: appState)
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                Text(String(appState.team1TotalScore))
                Text (String(appState.team2TotalScore))
            }.font(.title) // end LazyVGrid
            
            List {
                ForEach(appState.playersList.indices, id: \.self) { index in
                    HStack{
                        
                        PlayerNameView(appState: appState, playerIndex: index)
                        
                        BidPickerView(appState: appState, playerIndex: index, onBidChanged: {
                            self.teamBids = appState.setTeamBids(from: appState.playersList)
                        }
                    )}
                }
                
                HStack{
                    Text("Team1 Bid: \(teamBids.team1Bids)")
                    Text("Team2 Bid: \(teamBids.team2Bids)")
                }
            } // end List
            VStack{
                LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                    HStack{
                        Text("Team Bid: \(teamBids.team1Bids)")
                    }
                    HStack{
                        Text("Team Bid: \(teamBids.team2Bids)")
                    } // end LazyVGrid
                }.font(.headline)
            }
            
           
            
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                HStack{
                    Text("Team Sluffs: ")
                    Text(String(appState.team1TotalSluffs))
                }
                HStack{
                    Text("Team Sluffs: ")
                    Text(String(appState.team2TotalSluffs))
                } // end LazyVGrid
            }.font(.headline)
            
        } // end VStack
    }
}

#Preview {
    ScorecardView()
        .environment(AppState())
}


