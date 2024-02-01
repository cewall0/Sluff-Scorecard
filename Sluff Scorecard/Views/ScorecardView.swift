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
    
    private var twoColumnGrid = [GridItem(.fixed(140)), GridItem(.fixed(140))]
    
    private var fiveColumnGrid = [GridItem(.fixed(180)), GridItem(.fixed(65)), GridItem(.fixed(30)), GridItem(.fixed(30)), GridItem(.fixed(35))]
    
    var body: some View {
        VStack{
            
            Text("Sluff Scorecard")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 10)
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                Text("Team 1")
                Text ("Team 2")
            }.font(.title) // end LazyVGrid
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                Text("50")
                Text ("200")
            }.font(.title3) // end LazyVGrid
            
                List(appState.playersList) { player in
                    LazyVGrid(columns: fiveColumnGrid, alignment: .leading, spacing:2) {
                        Text(player.name).padding(.leading, 20.0) // column 1
                        Text("Sluffing: ") // column 2
                        Text(player.didSluff ? "Yes" : "No").fontWeight(.bold).foregroundColor(.blue) // column 3
                        Text("Bid: ") // column 4
                        Text(String(player.playerBid)).fontWeight(.bold).foregroundColor(.blue) // column 5
                    } // end LazyVGrid
            } // end List
        } // end VStack
    }
}

#Preview {
    ScorecardView()
        .environment(AppState())
}


