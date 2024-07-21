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
    
    func reset() {
        self.path = NavigationPath()
    }

    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                ScrollView {
                    VStack {
                        HStack {
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
                                        .frame(width: 100, alignment: .center)
                                        .foregroundColor(.black)
                                    
                                    Text(String(game.runningScores[game.round-1].t1RoundScore))
                                        .font(.largeTitle)
                                    
                                    Text(String(game.runningScores[game.round-1].t2RoundScore))
                                        .font(.largeTitle)
                                }
                                .font(widthSizeClass == .regular ? .title : .title2)
                                .padding(.bottom, 5)
                                
                                GridRow {
                                    Text("Round")
                                        .frame(width: 100, alignment: .center)
                                        .foregroundStyle(.black)
                                    
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
                                            .frame(width: 100, alignment: .center)
                                            .foregroundColor(.red)
                                            
                                            HStack {
                                                Text("(\(score.t1ChangeInScore))")
                                                Text("\(score.t1RoundScore)")
                                            }
                                            .foregroundColor(score.thisRound < game.round ? .black : .clear)
                                            .background(score.thisRound < game.round ? .blue.opacity(0.3) : .clear)
                                            .cornerRadius(8)
                                            
                                            HStack {
                                                Text("(\(String(score.t2ChangeInScore)))")
                                                Text(String(score.t2RoundScore))
                                            }
                                            .foregroundColor(score.thisRound < game.round ? .black : .clear)
                                            .background(score.thisRound < game.round ? .gray.opacity(0.3) : .clear)
                                            .cornerRadius(8)
                                        }
                                        .font(widthSizeClass == .regular ? .title3 : .headline)
                                        
                                        GridRow {
                                            Text("Tricks")
                                                .frame(width: 100, alignment: .center)
                                            
                                            HStack {
                                                Text(score.t1TricksWonStr)
                                                Text("won")
                                                Text("/")
                                                Text(score.t1TricksBidStr)
                                                Text("bid")
                                            }
                                            .foregroundColor(score.thisRound < game.round ? .black : .clear)
                                            .cornerRadius(8)
                                            
                                            HStack {
                                                Text(score.t2TricksWonStr)
                                                Text("won")
                                                Text("/")
                                                Text(score.t2TricksBidStr)
                                                Text("bid")
                                            }
                                            .foregroundColor(score.thisRound < game.round ? .black : .clear)
                                            .cornerRadius(8)
                                        }
                                        .font(widthSizeClass == .regular ? .headline : .callout)
                                        
                                        GridRow {
                                            Text("Sluffs")
                                                .frame(width: 100, alignment: .center)
                                            
                                            HStack {
                                                Text(score.t1SluffsWonStr)
                                                Text("won")
                                                Text("/")
                                                Text(score.t1SluffsBidStr)
                                                Text("bid")
                                            }
                                            .foregroundColor(score.thisRound < game.round ? .black : .clear)
                                            .cornerRadius(8)
                                            
                                            HStack {
                                                Text(score.t2SluffsWonStr)
                                                Text("won")
                                                Text("/")
                                                Text(score.t2SluffsBidStr)
                                                Text("bid")
                                            }
                                            .foregroundColor(score.thisRound < game.round ? .black : .clear)
                                            .cornerRadius(8)
                                        }
                                        .font(widthSizeClass == .regular ? .headline : .callout)
                                        Divider()
                                    }
                                }
                            }
                            .padding(.horizontal, 5)
                        }
                    }
                }
                
                Spacer()
            }
            
            VStack {
                Spacer()
                Button(action: {
                    reset()
                    path.append(1)
                }, label: {
                    Text("Return to Scorecard")
                })
                .buttonStyle(.borderedProminent)
                .tint(.accentColor)
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HistoryView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}

