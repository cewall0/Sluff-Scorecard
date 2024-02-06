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
    
    
    
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var sixColumnGrid = [GridItem(.fixed(20)),GridItem(.flexible()), GridItem(.fixed(105))]
    
    var body: some View {
        
        NavigationStack() {
            
            VStack{
                
                TitleView()
                
                TeamNameView(game: game)
                
                TeamScoresView()
                
                NavigationStack {
                    VStack{
                        
                        List {
                            ForEach(game.playersList.indices, id: \.self) { index in
                                HStack{
                                    Text("D")
                                        .fontWeight(.bold)
                                        .foregroundColor(game.playersList[index].isDealer ? .yellow.opacity(1.0): .yellow.opacity(0.0))
                                    
                                    PlayerNameView(game: game, playerIndex: index)
                                    
                                    BidPickerView(game: game, playerIndex: index, onBidChanged: {
                                        game.setTeamBids(from: game.playersList)
                                    }
                                    )}
                            }
                        }// end List
                        .listStyle(.plain)
                        
                        NavigationLink {
                            ScoreHandView(game: game).onAppear {
                                self.game.resetTricksSluffsWon()
                            }
                        } label: {
                            Text("Score this hand")
                        }.buttonStyle(.borderedProminent)
                            .navigationBarBackButtonHidden(true)
                    }
                }
            }
        }
    }
}

#Preview {
    ScorecardView()
        .environment(Game())
}




