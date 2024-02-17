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
    let sluffChoices0 = ["0"]
    let sluffChoices1 = ["0", "1"]
    let sluffChoices2 = ["0", "1", "2"]
    let sluffChoices3 = ["0", "1", "2", "3"]
    let sluffChoices4 = ["0", "1", "2", "3", "4"]


    var body: some View {
        @Bindable var game = game

        VStack{
            Image("Sluff Scorecard")
                .resizable()
                .frame(width: 200, height: 80)


            TeamNameView()
            
            TeamScoresView()
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                HStack{
                    Text("Tricks Won:")
                    Picker("Tricks Won:", selection: $game.team1TricksWonStr) {
                        Text("--").tag("--")
                        ForEach(0...14, id:\.self){ tricksWon in
                            Text("\(tricksWon)").tag("\(tricksWon)")
                        }
                    }
                } // end HStack
                
                HStack{
                    Text("Tricks Won:")
                    if game.team1TricksWonStr != "--" {
                        Text(String(14-Int(game.team1TricksWonStr)!)).foregroundColor(.blue)
                    } else {
                        Text("--").foregroundColor(.blue)
                    }

                } // end HStack
            } // end lazygrid
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                HStack{
                    Text("Sluffs Won:")
                    Picker("Sluffs Won:", selection: $game.team1SluffsWonStr) {
                        if game.team1TotalSluffs == 0 {
                            Text("--").tag("--")
                            Text("0").tag("0")
                        } else if game.team1TotalSluffs == 1 {
                            Text("--").tag("--")
                            ForEach(sluffChoices1, id:\.self){
                                Text($0)
                            }
                        } else if game.team1TotalSluffs == 2 {
                            Text("--").tag("--")
                            ForEach(sluffChoices2, id:\.self){
                                Text($0)
                            }
                        } else if game.team1TotalSluffs == 3 {
                            Text("--").tag("--")
                            ForEach(sluffChoices3, id:\.self){
                                Text($0)
                            }
                        } else {
                            Text("--").tag("--")
                            ForEach(sluffChoices4, id:\.self){
                                Text($0)
                            }
                        }
                    }
                } // end HStack
                
                HStack{
                    if game.team2TotalSluffs == 0 {
                        Text("Sluffs Won:")
                        Picker("Sluffs Won:", selection: $game.team2SluffsWonStr) {
                            Text("--").tag("--")
                            Text("0").tag("0")
                        }
                    } else if game.team2TotalSluffs == 1 {
                        Text("Sluffs Won:")
                        Picker("Sluffs Won:", selection: $game.team2SluffsWonStr) {
                            Text("--").tag("--")
                            Text("0").tag("0")
                            Text("1").tag("1")
                        }
                    } else if game.team2TotalSluffs == 2 {
                        Text("Sluffs Won:")
                        Picker("Sluffs Won:", selection: $game.team2SluffsWonStr) {
                            Text("--").tag("--")
                            Text("0").tag("0")
                            Text("1").tag("1")
                            Text("2").tag("2")
                        }
                    } else if game.team2TotalSluffs == 3 {
                        Text("Sluffs Won:")
                        Picker("Sluffs Won:", selection: $game.team2SluffsWonStr) {
                            Text("--").tag("--")
                            Text("0").tag("0")
                            Text("1").tag("1")
                            Text("2").tag("2")
                            Text("3").tag("3")
                        }
                    } else {
                        Text("Sluffs Won:")
                        Picker("Sluffs Won:", selection: $game.team2SluffsWonStr) {
                            Text("--").tag("--")
                            Text("0").tag("0")
                            Text("1").tag("1")
                            Text("2").tag("2")
                            Text("3").tag("3")
                            Text("4").tag("4")
                        }
                    }
   
                } // end HStack
            } // end lazygrid
            
            Spacer()
            
            Button(action: {
                self.game.updateScore()
                self.game.resetBids()
                self.game.nextDealer()
                self.game.isGameOver()
                if game.gameOver == true {
                    game.declareWinner()
                    router.reset()
                    router.path.append(4)
                } else {
                    router.reset()
                    router.path.append(1)
                }
            }, label: {
                Text("Update Scores")
            })
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            .disabled(game.team1TricksWonStr == "--" || game.team1SluffsWonStr == "--"  || game.team2SluffsWonStr == "--")
            
           
        } // end Vstack
            
        }
    }


#Preview {
    ScoreHandView()
        .environment(Game())
}

