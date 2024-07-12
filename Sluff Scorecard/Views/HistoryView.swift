//
//  HistoryView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 3/7/24.
//

import Foundation
import SwiftUI
import Observation


struct HistoryView: View {
    
    @Environment(Game.self) private var game
    
    @Binding var path: NavigationPath

    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    var body: some View {

        VStack(alignment: .center){
            HStack {
//                Button(action: {
//                    path.append(6)
//                }, label: {
//                    Image(systemName: "pencil")
//                        .font(widthSizeClass == .regular ? .largeTitle : .title)
//                })
//                .padding(.leading)
//                .foregroundColor(.gray)
                
                Spacer()
                
                Image("SluffScorecardTitleSVG")
                    .resizable()
                    .frame(width: 250, height: 140)
                    .padding(.top, -10)
                    .padding(.bottom, -30)
                
                Spacer()
                
            }
            
                

            VStack {
                Text("(Round-by-Round History)")
                    .padding(.bottom, 5)
                
                Text("- Tap on round's number to edit an entry. -")
                    .padding(.bottom, 5)
                
                Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 2) {
                    
                    GridRow {
                        
                        Text("Score")
                            .frame(width: 120, alignment: .center)
                            .foregroundColor(.black)
                        
                        Text (String(game.runningScores[game.round-1].t1RoundScore))
                            .font(.largeTitle)
//                            .background(.blue.opacity(0.3))
//                            .foregroundStyle(.black)
//                            .cornerRadius(8)
                        
                        Text (String(game.runningScores[game.round-1].t2RoundScore))
                            .font(.largeTitle)
//                            .background(.gray.opacity(0.3))
//                            .foregroundStyle(.black)
//                            .cornerRadius(8)
                        
                    }
                    .font(widthSizeClass == .regular ? .title : .title2)
                    .padding(.bottom, 5)

                    
                    GridRow {
                        Text("Round")
                            .frame(width: 120, alignment: .center)
                            .foregroundColor(.black)
                        
                        Text(game.team1Name)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                            .background(.blue.opacity(0.3))
                            .foregroundStyle(.black)
                            .cornerRadius(8)
                        
                        Text(game.team2Name)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                            .background(.gray.opacity(0.3))
                            .foregroundStyle(.black)
                            .cornerRadius(8)
                        
                    }
                    .font(widthSizeClass == .regular ? .title : .title2)
                    .padding(.bottom, 10)
                    .padding(.top, 10)

                    Divider()
                    
                    ForEach(game.runningScores) { score in
                        
                        if score.thisRound >= game.round {
                            GridRow {
                                Text("")
                                Text("")
                                Text("")
                            }
                        } else {

                                            GridRow {
                                                Button(action: {
                                                    game.roundToFix = score.thisRound
                                                    path.append(6)
                                                }, label: {
                                                    Text("\(score.thisRound)")
                                                        .font(widthSizeClass == .regular ? .title : .title2)
                                                })
//                                                .padding(.leading)
                                                .frame(width: 80, alignment: .center)
                                                .foregroundColor(.red)
                                                
                                                HStack {
                                                    Text("(\(score.t1ChangeInScore))")
                                                    Text("\(score.t1RoundScore)")
                                                }
//                                                .padding(.horizontal, 20)
//                                                .padding(.vertical, 2)
                                                .foregroundColor(score.thisRound < game.round ? .black : .clear)
                                                .background(score.thisRound < game.round ? .blue.opacity(0.3) : .clear)
                                                .cornerRadius(8)
                                                
                                                HStack {
                                                    Text("(\(String(score.t2ChangeInScore)))")
                                                    Text(String(score.t2RoundScore))
                                                }
//                                                .padding(.horizontal, 20)
//                                                .padding(.vertical, 2)
                                                .foregroundColor(score.thisRound < game.round ? .black : .clear)
                                                .background(score.thisRound < game.round ? .gray.opacity(0.3) : .clear)
                                                .cornerRadius(8)
                                            }
                                            .font(widthSizeClass == .regular ? .title3 : .headline)
                        
                        GridRow {
                            
                            if score.thisRound == 1 {
                                Text("Tricks (won/bid)")
                                    .frame(width: 120, alignment: .center)

                            } else {
                                Text("Tricks")
                                    .frame(width: 120, alignment: .center)

                            }
                            
                            HStack{
                                Text("(\(String(score.t1TricksWon))")
                                Text("/")
                                Text("\(String(score.t1TricksBid)))")
                            }
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 2)
                            .foregroundColor((score.thisRound) < game.round ? .black : .clear)
                            .cornerRadius(8)
                            
                            HStack{
                                Text("(\(String(score.t2TricksWon))")
                                    .foregroundColor((score.thisRound)  < game.round ? .black : .clear)
                                Text("/")
                                Text("\(String(score.t2TricksBid)))")
                            }
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 2)
                            .foregroundColor((score.thisRound) < game.round ? .black : .clear)
                            .cornerRadius(8)

                    }// end GridRow
                        .font(widthSizeClass == .regular ? .headline : .callout)
//                        Divider()
                        
                        GridRow {
                            
                            if score.thisRound == 1 {
                                Text("Sluffs (won/bid)")
                                    .frame(width: 120, alignment: .center)

                            } else {
                                Text("Sluffs")
                                    .frame(width: 120, alignment: .center)

                            }
                            
                            HStack{
                                Text("(\(String(score.t1SluffsWon))")
                                Text("/")
                                Text("\(String(score.t1SluffsBid)))")
                            }
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 2)
                            .foregroundColor((score.thisRound) < game.round ? .black : .clear)
                            .cornerRadius(8)
                            
                            HStack{
                                Text("(\(String(score.t2SluffsWon))")
                                    .foregroundColor((score.thisRound)  < game.round ? .black : .clear)
                                Text("/")
                                Text("\(String(score.t2SluffsBid)))")
                            }
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 2)
                            .foregroundColor((score.thisRound) < game.round ? .black : .clear)
                            .cornerRadius(8)

                    }// end GridRow
                        .font(widthSizeClass == .regular ? .headline : .callout)
                        Divider()
                    } // end ForEach
                    
                } // end grid
                .padding(.horizontal, 5)
                
                }// end if else
                
                Spacer()
                
                }
            }
        }
    }


#Preview {
    HistoryView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}
