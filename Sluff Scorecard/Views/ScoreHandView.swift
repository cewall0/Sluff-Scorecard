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
                .padding(.bottom, -25)
            
            RoundView()
                .padding(.bottom, 10)
            
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
                    Text(String(game.runningScores[game.round-1].t1RoundScore))
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text(String(game.runningScores[game.round-1].t2RoundScore))
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                GridRow{
                    Text("Team Bid: \(game.runningScores[game.round-1].t1TricksBid)")
                        .font(widthSizeClass == .regular ? .title : .title2)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("Team Bid: \(game.runningScores[game.round-1].t2TricksBid)")
                        .font(widthSizeClass == .regular ? .title : .title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                GridRow{
                    Text("Team Sluffs: \(game.runningScores[game.round-1].t1SluffsBid)")
                        .font(widthSizeClass == .regular ? .title : .title2)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("Team Sluffs: \(game.runningScores[game.round-1].t2SluffsBid)")
                        .font(widthSizeClass == .regular ? .title : .title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Divider()
                
                GridRow {
                    
                    HStack{
                        Text("Tricks Won:")
                        Picker("Tricks Won:", selection: $game.runningScores[game.round-1].t1TricksWonStr) {
                            Text("--").tag("--")
                            ForEach(0...14, id:\.self){ tricksWon in
                                Text("\(tricksWon)").tag("\(tricksWon)")
                            }
                        }
                    } // end HStack
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                    
                    HStack{
                        Text("Tricks Won:")
                        if game.runningScores[game.round-1].t1TricksWonStr != "--" {
                            Text(String(14-Int(game.runningScores[game.round-1].t1TricksWonStr)!)).foregroundColor(.accentColor)
                        } else {
                            Text("--").foregroundColor(.accentColor)
                        }
                    } // end HStack
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                }
                
                GridRow{
                    HStack{
                        Text("Sluffs Won: ")

                        if game.runningScores[game.round-1].t1SluffsBid != 0{
                            Picker("Sluffs Won:", selection: $game.runningScores[game.round-1].t1SluffsWonStr) {
                                
                                ForEach(game.sluffTeam1ChoiceList, id:\.self){
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                        } else {
                            Text("0")
                                .foregroundStyle(.blue)
                        }
                    }// end HStack for Team 1 sluffs
                    .onAppear {
                                if game.runningScores[game.round-1].t1SluffsBid == 0 {
                                    game.runningScores[game.round-1].t1SluffsWonStr = "0"
                                    game.runningScores[game.round-1].t1SluffsBidStr = "0"

                                }
                            }
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                    
                    HStack{
                        Text("Sluffs Won: ")

                        if game.runningScores[game.round-1].t2SluffsBid != 0 {
                            Picker("Sluffs Won:", selection: $game.runningScores[game.round-1].t2SluffsWonStr) {
                                
                                ForEach(game.sluffTeam2ChoiceList, id:\.self){
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                        } else {
                            Text("0")
                                .foregroundStyle(.blue)
                        }
                    }// end HStack for Team 2 sluffs
                    .onAppear {
                                if game.runningScores[game.round-1].t2SluffsBid == 0 {
                                    game.runningScores[game.round-1].t2SluffsWonStr = "0"
                                    game.runningScores[game.round-1].t2SluffsBidStr = "0"
                                }
                            }
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                }
            } // end Grid

            
            Button(action: {
              
                self.game.calculateScore()
                self.game.resetPlayerBids()
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
            .disabled(game.runningScores[game.round-1].t1TricksWonStr == "--" || game.runningScores[game.round-1].t1SluffsWonStr == "--"  || game.runningScores[game.round-1].t2SluffsWonStr == "--")

            
            Spacer()
           
        } // end Vstack

        }
    
    }

func getRootViewController() -> UIViewController? {
       guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
           return nil
       }
       return windowScene.windows.first?.rootViewController
   }


#Preview {
    ScoreHandView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}

