//
//  ScoreHandView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/4/24.
//

import SwiftUI

struct ScoreHandView: View {
    
    @Bindable var game: Game
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack{

        VStack{
            TitleView()
            
            TeamNameView(game: game)
            
            TeamScoresView()
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                HStack{
                    Text("Tricks Won:")
                    Picker("Tricks Won:", selection: $game.team1TricksWon) {
                        ForEach(0...14,id:\.self){
                            Text("\($0)")
                        }
                    }
                } // end HStack
                
                HStack{
                    Text("Tricks Won:")
                    Picker("Tricks Won:", selection: $game.team2TricksWon) {
                        ForEach(0...14,id:\.self){
                            Text("\($0)")
                        }
                    }
                } // end HStack
            } // end lazygrid
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                HStack{
                    Text("Sluffs Won:")
                    Picker("Sluffs Won:", selection: $game.team1SluffsWon) {
                        ForEach(0...game.team1TotalSluffs,id:\.self){
                            Text("\($0)")
                        }
                    }
                } // end HStack
                
                HStack{
                    Text("Sluffs Won:")
                    Picker("Sluffs Won:", selection: $game.team2SluffsWon) {
                        ForEach(0...game.team2TotalSluffs,id:\.self){
                            Text("\($0)")
                        }

                    } // end picker
                } // end HStack
            } // end lazygrid
            
            NavigationLink {
                ScorecardView().onAppear {
                    self.game.updateScore()
                    self.game.resetBids()
                    self.game.nextDealer()
                    self.game.isGameOver()
                }
            } label: {
                Text("Update Scores")
            }.buttonStyle(.borderedProminent)
                .navigationBarBackButtonHidden(true)

            Spacer()
        } // end Vstack
            
        }
    }
}

//#Preview {
//    ScoreHandView(game: Game())
//}

