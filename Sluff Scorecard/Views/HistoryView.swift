
//
//  HistoryView.swift
//  Sluff Scorecard
//
//  Refactored by Chad Wallace
//

import SwiftUI
import Observation

struct HistoryView: View {
    @Environment(Game.self) private var game
    @Binding var path: NavigationPath
    
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    // Last completed round index
    var lastCompletedRound: Int {
        game.gameOver ? game.numberOfPlayers : game.round - 1
    }
    
    func reset() {
        self.path = NavigationPath()
    }
    
    // Helper for responsive font sizing
    func responsiveFont(_ large: Font, _ small: Font) -> Font {
        widthSizeClass == .regular ? large : small
    }
    
    // Helper for displaying Tricks or Sluffs rows
    func statRow(label: String, t1Value: String, t2Value: String) -> some View {
        GridRow {
            Text(label)
                .frame(width: 100, alignment: .center)
                .foregroundColor(.black)
            
            HStack {
                Text(t1Value)
            }
            .foregroundColor(.black)
            .background(.blue.opacity(0.3))
            .cornerRadius(8)
            
            HStack {
                Text(t2Value)
            }
            .foregroundColor(.black)
            .background(.gray.opacity(0.3))
            .cornerRadius(8)
        }
        .font(responsiveFont(.headline, .callout))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 10) {
                    // ───────────── Header Image ─────────────
                    HStack {
                        Spacer()
                        Image("SluffScorecardTitleSVG")
                            .resizable()
                            .frame(width: 250, height: 140)
                            .padding(.top, -10)
                            .padding(.bottom, -30)
                        Spacer()
                    }
                    
                    // ───────────── Instructions ─────────────
                    VStack(spacing: 2) {
                        Text("(Round-by-Round History)")
                        Text("- Tap on round's number to edit an entry. -")
                    }
                    .padding(.bottom, 5)
                    
                    // ───────────── Header Grid ─────────────
                    Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 2) {
                        GridRow {
                            Text("Score")
                                .frame(width: 100, alignment: .center)
                        }
                        .font(responsiveFont(.title, .title2))
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
                        .font(responsiveFont(.title, .title2))
                        .padding(.vertical, 10)
                        
                        Divider()
                        
                        // ───────────── Round History ─────────────
                        ForEach(game.runningScores.filter { $0.thisRound <= lastCompletedRound }) { score in
                            // Round number button + scores
                            GridRow {
                                Button {
                                    game.roundToFix = score.thisRound
                                    path.append(6) // Navigate to FixScoreView
                                } label: {
                                    Text("\(score.thisRound)")
                                        .font(responsiveFont(.title, .title2))
                                        .foregroundColor(.red)
                                }
                                .frame(width: 100, alignment: .center)
                                
                                HStack {
                                    Text("(\(score.t1ChangeInScore))")
                                    Text("\(score.t1RoundScore)")
                                }
                                .foregroundColor(.black)
                                .background(.blue.opacity(0.3))
                                .cornerRadius(8)
                                
                                HStack {
                                    Text("(\(score.t2ChangeInScore))")
                                    Text("\(score.t2RoundScore)")
                                }
                                .foregroundColor(.black)
                                .background(.gray.opacity(0.3))
                                .cornerRadius(8)
                            }
                            .font(responsiveFont(.title3, .headline))
                            
                            // Tricks row
                            statRow(
                                label: "Tricks",
                                t1Value: "\(score.t1TricksWonStr) won / \(score.t1TricksBidStr) bid",
                                t2Value: "\(score.t2TricksWonStr) won / \(score.t2TricksBidStr) bid"
                            )
                            
                            // Sluffs row
                            statRow(
                                label: "Sluffs",
                                t1Value: "\(score.t1SluffsWonStr) won / \(score.t1SluffsBidStr) bid",
                                t2Value: "\(score.t2SluffsWonStr) won / \(score.t2SluffsBidStr) bid"
                            )
                            
                            Divider()
                        }
                    }
                    .padding(.horizontal, 5)
                }
            }
            
            Spacer()
            
            // ───────────── Return Button ─────────────
            Button(action: {
                reset()
                path.append(1) // Return to Scorecard
            }) {
                Text("Return to Scorecard")
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HistoryView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}
