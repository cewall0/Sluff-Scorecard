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

    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?

    // Reset navigation path
    func reset() {
        self.path = NavigationPath()
    }

    var body: some View {
        @Bindable var game = game

        VStack {
            // Title
            HStack {
                Spacer()
                Image("SluffScorecardTitleSVG")
                    .resizable()
                    .frame(width: 250, height: 140)
                    .padding(.top, -10)
                    .padding(.bottom, -30)
                Spacer()
            }

            // Round info
            HStack {
                Text("Fixing Round")
                Text("\(game.roundToFix)")
            }
            .font(.headline)
            .padding()
            .background(.yellow.opacity(0.25))
            .cornerRadius(10)

            // Grid for scores and pickers
            Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 2) {

                // Team Names
                GridRow {
                    scoreHeader(game.team1Name, color: .blue.opacity(0.3))
                    scoreHeader(game.team2Name, color: .gray.opacity(0.3))
                }

                // Round scores
                GridRow {
                    scoreCell("\(game.runningScores[game.roundToFix-1].t1RoundScore)", color: .blue.opacity(0.3))
                    scoreCell("\(game.runningScores[game.roundToFix-1].t2RoundScore)", color: .gray.opacity(0.3))
                }

                // Tricks Won
                GridRow {
                    pickerWithLabel(
                        label: "Tricks Won",
                        selection: $game.runningScores[game.roundToFix-1].t1TricksWon,
                        range: 0...game.totalTricks
                    ) { newValue in
                        let index = game.roundToFix - 1
                        game.runningScores[index].t2TricksWon = game.totalTricks - newValue
                        game.runningScores[index].t1TricksWonStr = String(newValue)
                        game.runningScores[index].t2TricksWonStr = String(game.runningScores[index].t2TricksWon)
                    }

                    HStack {
                        Text("Tricks Won:")
                        Text("\(game.runningScores[game.roundToFix-1].t2TricksWon)")
                    }
                    .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
                }

                // Tricks Bid
                GridRow {
                    pickerWithLabel(
                        label: "Tricks Bid",
                        selection: $game.runningScores[game.roundToFix-1].t1TricksBid,
                        range: 0...game.totalTricks
                    ) { newValue in
                        let index = game.roundToFix - 1
                        game.runningScores[index].t1TricksBidStr = String(newValue)
                        if game.runningScores[index].t1TricksWon > newValue {
                            game.runningScores[index].t1TricksWon = newValue
                            game.runningScores[index].t1TricksWonStr = String(newValue)
                        }
                    }

                    pickerWithLabel(
                        label: "Tricks Bid",
                        selection: $game.runningScores[game.roundToFix-1].t2TricksBid,
                        range: 0...game.totalTricks
                    ) { newValue in
                        let index = game.roundToFix - 1
                        game.runningScores[index].t2TricksBidStr = String(newValue)
                        if game.runningScores[index].t2TricksWon > newValue {
                            game.runningScores[index].t2TricksWon = newValue
                            game.runningScores[index].t2TricksWonStr = String(newValue)
                        }
                    }
                }

                // Sluffs Won
                GridRow {
                    pickerWithLabel(
                        label: "Sluffs Won",
                        selection: $game.runningScores[game.roundToFix-1].t1SluffsWon,
                        range: 0...game.runningScores[game.roundToFix-1].t1SluffsBid
                    ) { newValue in
                        let index = game.roundToFix - 1
                        game.runningScores[index].t1SluffsWonStr = String(newValue)
                        if newValue > game.runningScores[index].t1SluffsBid {
                            game.runningScores[index].t1SluffsWon = game.runningScores[index].t1SluffsBid
                            game.runningScores[index].t1SluffsWonStr = String(game.runningScores[index].t1SluffsBid)
                        }
                    }

                    pickerWithLabel(
                        label: "Sluffs Won",
                        selection: $game.runningScores[game.roundToFix-1].t2SluffsWon,
                        range: 0...game.runningScores[game.roundToFix-1].t2SluffsBid
                    ) { newValue in
                        let index = game.roundToFix - 1
                        game.runningScores[index].t2SluffsWonStr = String(newValue)
                        if newValue > game.runningScores[index].t2SluffsBid {
                            game.runningScores[index].t2SluffsWon = game.runningScores[index].t2SluffsBid
                            game.runningScores[index].t2SluffsWonStr = String(game.runningScores[index].t2SluffsBid)
                        }
                    }
                }

                // Sluffs Bid
                GridRow {
                    pickerWithLabel(
                        label: "Sluffs Bid",
                        selection: $game.runningScores[game.roundToFix-1].t1SluffsBid,
                        range: 0...game.totalTricks
                    ) { newValue in
                        let index = game.roundToFix - 1
                        game.runningScores[index].t1SluffsBidStr = String(newValue)
                        if game.runningScores[index].t1SluffsWon > newValue {
                            game.runningScores[index].t1SluffsWon = newValue
                            game.runningScores[index].t1SluffsWonStr = String(newValue)
                        }
                    }

                    pickerWithLabel(
                        label: "Sluffs Bid",
                        selection: $game.runningScores[game.roundToFix-1].t2SluffsBid,
                        range: 0...game.totalTricks
                    ) { newValue in
                        let index = game.roundToFix - 1
                        game.runningScores[index].t2SluffsBidStr = String(newValue)
                        if game.runningScores[index].t2SluffsWon > newValue {
                            game.runningScores[index].t2SluffsWon = newValue
                            game.runningScores[index].t2SluffsWonStr = String(newValue)
                        }
                    }
                }
            } // end Grid

            // OK Button
            Button {
                game.recalculateScores(from: game.roundToFix)
                reset()
                path.append(5)
            } label: {
                Text("OK")
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)

            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - Helper Views
extension FixScoreView {
    func scoreHeader(_ text: String, color: Color) -> some View {
        Text(text)
            .font(widthSizeClass == .regular ? .largeTitle : .title)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(color)
            .foregroundStyle(.black)
            .cornerRadius(8)
    }

    func scoreCell(_ text: String, color: Color) -> some View {
        Text(text)
            .font(widthSizeClass == .regular ? .largeTitle : .title)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(color)
            .foregroundStyle(.black)
            .cornerRadius(8)
    }

    func pickerWithLabel(
        label: String,
        selection: Binding<Int>,
        range: ClosedRange<Int>,
        onChange: @escaping (Int) -> Void
    ) -> some View {
        HStack {
            Text("\(label):")
            Picker(label, selection: selection) {
                ForEach(range, id: \.self) { value in
                    Text("\(value)").tag(value)
                }
            }
            // ✅ iOS 17 style, no deprecation warning
            .onChange(of: selection.wrappedValue) { oldValue, newValue in
                onChange(newValue)
            }
        }
        .scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
    }
}

// MARK: - Preview
#Preview {
    FixScoreView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}

