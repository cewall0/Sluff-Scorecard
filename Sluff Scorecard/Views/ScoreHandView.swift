//
//  ScoreHandView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/4/24.
//

import SwiftUI

struct ScoreHandView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router

    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        @Bindable var game = game

        VStack{
            TitleView()

            TeamNameView()
            
            TeamScoresView()
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                HStack{
                    Text("Tricks Won:")
                    Picker("Tricks Won:", selection: $game.team1TricksWonStr) {
                        Text("--").tag("--")
                        ForEach(0...14,id:\.self){
                            Text("\($0)").tag("\($0)")
                        }
                    }
                } // end HStack
                
                HStack{
                    Text("Tricks Won:")
                    if game.team1TricksWonStr != "--" {
                        Text(String(14-Int(game.team1TricksWonStr)!))
                    } else {
                        Text("--")
                    }
//                    Picker("Tricks Won:", selection: $game.team2TricksWonStr) {
                      
//                        Text("--").tag("--")
//                        ForEach(0...14,id:\.self){
//                            Text("\($0)").tag("\($0)")
//                        }
//                    }
                } // end HStack
            } // end lazygrid
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                HStack{
                    Text("Sluffs Won:")
                    Picker("Sluffs Won:", selection: $game.team1SluffsWonStr) {
                        Text("--").tag("--")
                        ForEach(0...game.team1TotalSluffs,id:\.self){
                            Text("\($0)").tag("\($0)")
                        }
                    }
                } // end HStack
                
                HStack{
                    Text("Sluffs Won:")
                    Picker("Sluffs Won:", selection: $game.team2SluffsWonStr) {
                        Text("--").tag("--")
                        ForEach(0...game.team2TotalSluffs,id:\.self){
                            Text("\($0)").tag("\($0)")
                        }

                    } // end picker
                } // end HStack
            } // end lazygrid
            
            Spacer()
            
            Button(action: {
                self.game.updateScore()
                self.game.resetBids()
                self.game.nextDealer()
                self.game.isGameOver()
                router.reset()
            }, label: {
                Text("Update Scores")
            })
            .buttonStyle(.borderedProminent)
            .disabled(game.team1TricksWonStr == "--" || game.team1SluffsWonStr == "--"  || game.team2SluffsWonStr == "--")
            
           
        } // end Vstack
            
        }
    }


#Preview {
    ScoreHandView()
        .environment(Game())
}

