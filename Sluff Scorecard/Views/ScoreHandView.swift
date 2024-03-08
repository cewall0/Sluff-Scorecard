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
    let sluffChoices5 = ["0", "1", "2", "3", "4", "5"]


    var body: some View {
        @Bindable var game = game

        VStack{
            Image("color sluff scorecard")
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
                        Text(String(14-Int(game.team1TricksWonStr)!)).foregroundColor(.accentColor)
                    } else {
                        Text("--").foregroundColor(.accentColor)
                    }

                } // end HStack
            } // end lazygrid
            
            
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                
                HStack{
                    Text("Sluffs Won: ")

                    Picker("Sluffs Won:", selection: $game.team1SluffsWonStr) {
                       
                        ForEach(game.sluffTeam1ChoiceList, id:\.self){
                            Text($0)
                            }
                    }
                .pickerStyle(.menu)
                } // end HStack for Team 1 sluffs
                
                HStack{
                    Text("Sluffs Won: ")

                    Picker("Sluffs Won:", selection: $game.team2SluffsWonStr) {
                       
                        ForEach(game.sluffTeam2ChoiceList, id:\.self){
                            Text($0)
                            }
                    }
                .pickerStyle(.menu)
                } // end HStack for Team 2 sluffs

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

