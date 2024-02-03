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
    
    var twoColumnGrid = [GridItem(.fixed(140)), GridItem(.fixed(140))]
    
    var sixColumnGrid = [GridItem(.fixed(20)),GridItem(.flexible()), GridItem(.fixed(105))]
    
    var body: some View {
        
//        let playersList = appState.playersList.enumerated().map({ $0, $1 })
        
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
            
            
            List {
                ForEach(appState.playersList.indices, id: \.self) { index in
                    HStack{
                        Text(appState.playersList[index].name)
                        BidPickerView(appState: appState, playerIndex: index)
                    }
                   
                       }
                   }
            
            HStack{
                Text("1 bid")
                Text(String(appState.playersList[0].playerBid))
            }

        } // end VStack
    }
}

#Preview {
    ScorecardView()
        .environment(AppState())
}


