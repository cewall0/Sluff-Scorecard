//
//  FixScoreView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 6/27/24.
//

import SwiftUI

struct FixScoreView: View {
    @Environment(Game.self) private var game
    
    @Binding var path: NavigationPath
    
    func reset() {
        self.path = NavigationPath()
    }
    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        @Bindable var game = game
        
        VStack{
            HStack{
                Spacer()
                
                Image("SluffScorecardTitleSVG")
                    .resizable()
                    .frame(width: 250, height: 140)
                    .padding(.top, -10)
                    .padding(.bottom, -30)
                
                Spacer()
            }
            
            HStack{
                Text("Fixing Round")
                Text(String(game.roundToFix))
            }
            
            Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 2) {
                
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
                    Text("\(String(game.runningScores[game.round-1].t1RoundScore))")
                        .font(widthSizeClass == .regular ? .largeTitle : .title)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.blue.opacity(0.3))
                        .foregroundStyle(.black)
                        .cornerRadius(8)
                    
                    
                    Text("\(String(game.runningScores[game.round-1].t2RoundScore))")
                        .font(widthSizeClass == .regular ? .largeTitle : .title)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(8)
                }
                
                GridRow {
                    
                    HStack{
                        Text("Tricks Won:")
                        Text("\(String(game.runningScores[game.roundToFix-1].t1TricksWon))")
                        Picker("Tricks Won:", selection: $game.runningScores[game.roundToFix-1].t1TricksWon) {
                            ForEach(0...14, id:\.self){ tricksWon in
                                Text("\(tricksWon)").tag("\(tricksWon)")
                            }.onChange(of: game.runningScores[game.roundToFix-1].t1TricksWon) { _, _ in
                                game.runningScores[game.roundToFix-1].t2TricksWon = 14-game.runningScores[game.roundToFix-1].t1TricksWon
                                game.runningScores[game.roundToFix-1].t1TricksWonStr = String(game.runningScores[game.roundToFix-1].t1TricksWon)
                                game.runningScores[game.roundToFix-1].t2TricksWonStr = String(game.runningScores[game.roundToFix-1].t2TricksWon)
//                                game.calculateScore()
                            }
                        }
                    } // end HStack
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                    
                    HStack{
                        Text("Tricks Won:")
                        Text("\(game.runningScores[game.roundToFix-1].t2TricksWon)")
                    } // end HStack
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                    
                    } // end gridrow
                    
                    GridRow {
                        
                        HStack{
                            Text("Tricks Bid:")
                            Text("\(String(game.runningScores[game.roundToFix-1].t1TricksBid))")
                            Picker("Tricks Bid:", selection: $game.runningScores[game.roundToFix-1].t1TricksBid) {
                                ForEach(0...14, id:\.self){ tricksBid in
                                    Text("\(tricksBid)").tag("\(tricksBid)")
                                }
                            }
                        } // end HStack
                        .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                        
                        HStack{
                            Text("Tricks Bid:")
                            Text("\(String(game.runningScores[game.roundToFix-1].t2TricksBid))")
                            Picker("Tricks Bid:", selection: $game.runningScores[game.roundToFix-1].t2TricksBid) {
                                ForEach(0...14, id:\.self){ tricksBid in
                                    Text("\(tricksBid)").tag("\(tricksBid)")
                                }
                            }
                        } // end HStack
                        .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                    } // end gridrow
                    
                    GridRow {
                        
                        HStack{
                            Text("Sluffs Won:")
                            Text("\(String(game.runningScores[game.roundToFix-1].t1SluffsWon))")
                            Picker("Sluffs Won:", selection: $game.runningScores[game.roundToFix-1].t1SluffsWon) {
                                ForEach(0...game.runningScores[game.roundToFix-1].t1SluffsBid, id:\.self){ sluffsWon in
                                    Text("\(sluffsWon)").tag("\(sluffsWon)")
                                }
                            }
                        } // end HStack
                        .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                        
                        HStack{
                            Text("Sluffs Won:")
                            Text("\(String(game.runningScores[game.roundToFix-1].t2SluffsWon))")
                            Picker("Sluffs Won:", selection: $game.runningScores[game.roundToFix-1].t2SluffsWon) {
                                ForEach(0...game.runningScores[game.roundToFix-1].t2SluffsBid, id:\.self){ sluffsWon in
                                    Text("\(sluffsWon)").tag("\(sluffsWon)")
                                }
                            }
                        } // end HStack
                        .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                    } // end gridrow
                    
                    GridRow {
                        
                        HStack{
                            Text("Sluffs Bid:")
                            Text("\(String(game.runningScores[game.roundToFix-1].t1SluffsBid))")
                            Picker("Tricks Won:", selection: $game.runningScores[game.roundToFix-1].t1SluffsBid) {
                                ForEach(0...14, id:\.self){ sluffsBid in
                                    Text("\(sluffsBid)").tag("\(sluffsBid)")
                                }
                            }
                        } // end HStack
                        .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                        
                        HStack{
                            Text("Sluffs Bid:")
                            Text("\(String(game.runningScores[game.roundToFix-1].t2SluffsBid))")
                            Picker("Tricks Won:", selection: $game.runningScores[game.roundToFix-1].t2SluffsBid) {
                                ForEach(0...14, id:\.self){ sluffsBid in
                                    Text("\(sluffsBid)").tag("\(sluffsBid)")
                                }
                            }
                        } // end HStack
                        .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                    } // end Gridrow
                    
                } // end grid
                
                Button(action: {
                    game.calculateScore()
                    reset()
                    path.append(5)
                    
                }, label: {
                    Text("OK")
                })
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(.accentColor)
                
                Spacer()
                
        }.navigationBarBackButtonHidden() // end VStack
        }
    }


#Preview {
    FixScoreView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}


