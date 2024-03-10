//
//  ScoreHandView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/4/24.
//

import Foundation
import SwiftUI
import Observation


struct ScoreHandView: View {
    
    @Environment(Game.self) private var game
    
    @Binding var path: NavigationPath
    
    func reset() {
        self.path = NavigationPath()
    }

    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?

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
            Image("SluffScorecardTitleSVG")
                .resizable()
                .frame(width: 250, height: 140)
            
            Grid(alignment: .center, horizontalSpacing: 10, verticalSpacing: 10) {
                
                GridRow{
                    Text(game.team1Name)
                        .font(widthSizeClass == .regular ? .largeTitle : .title)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.blue.opacity(0.3))
                        .foregroundStyle(.black)
                        .cornerRadius(8)


                    Text(game.team2Name)
                        .font(widthSizeClass == .regular ? .largeTitle : .title)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(8)

                }
                
                GridRow{
                    Text(String(game.team1TotalScore))
//                        .font(widthSizeClass == .regular ? .largeTitle : .title)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text(String(game.team2TotalScore))
//                        .font(widthSizeClass == .regular ? .largeTitle : .title)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                GridRow{
                    Text("Team Bid: \(game.team1TotalBid)")
                        .font(widthSizeClass == .regular ? .title : .title2)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("Team Bid: \(game.team2TotalBid)")
                        .font(widthSizeClass == .regular ? .title : .title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                GridRow{
                    Text("Team Sluffs: \(game.team1TotalSluffs)")
                        .font(widthSizeClass == .regular ? .title : .title2)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("Team Sluffs: \(game.team2TotalSluffs)")
                        .font(widthSizeClass == .regular ? .title : .title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Divider()
                
                GridRow {
                    
                    HStack{
                        Text("Tricks Won:")
                        Picker("Tricks Won:", selection: $game.team1TricksWonStr) {
                            Text("--").tag("--")
                            ForEach(0...14, id:\.self){ tricksWon in
                                Text("\(tricksWon)").tag("\(tricksWon)")
                            }
                        }
                    } // end HStack
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                    
                    HStack{
                        Text("Tricks Won:")
                        if game.team1TricksWonStr != "--" {
                            Text(String(14-Int(game.team1TricksWonStr)!)).foregroundColor(.accentColor)
                        } else {
                            Text("--").foregroundColor(.accentColor)
                        }
                    } // end HStack
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                }
                
                GridRow{
                    HStack{
                        Text("Sluffs Won: ")

                        Picker("Sluffs Won:", selection: $game.team1SluffsWonStr) {
                           
                            ForEach(game.sluffTeam1ChoiceList, id:\.self){
                                Text($0)
                                }
                        }
                    .pickerStyle(.menu)
                    } // end HStack for Team 1 sluffs
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                    
                    HStack{
                        Text("Sluffs Won: ")

                        Picker("Sluffs Won:", selection: $game.team2SluffsWonStr) {
                           
                            ForEach(game.sluffTeam2ChoiceList, id:\.self){
                                Text($0)
                                }
                        }
                    .pickerStyle(.menu)
                    } // end HStack for Team 2 sluffs
                    .padding(.leading, 20)
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                }
            } // end Grid

            
            Button(action: {
                
                self.game.updateScore()
                self.game.resetBids()
                self.game.nextDealer()
                self.game.isGameOver()
                
                if game.gameOver == true {
                    game.declareWinner()
                    reset()
                    path.append(4)
                } else {
                    reset()
                    path.append(1)
                }
            }, label: {
                Text("Update Scores")
            })
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            .disabled(game.team1TricksWonStr == "--" || game.team1SluffsWonStr == "--"  || game.team2SluffsWonStr == "--")

            
            Spacer()
           
        } // end Vstack
            
        }
    }


#Preview {
    ScoreHandView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}

