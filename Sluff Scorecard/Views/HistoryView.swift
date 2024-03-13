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
            
            Image("SluffScorecardTitleSVG")
                .resizable()
                .frame(width: 250, height: 140)
                .padding(.top, -10)
                .padding(.bottom, -30)
                
            
            Text("(Round by Round History)")
                .padding(.bottom, 5)

            VStack {
                
                Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 2) {
                    
                    GridRow {
                        Text("Score")
                            .padding(.leading, 3)
                            .foregroundColor(.black)
                        
                        Text (String(game.team1TotalScore))
                            .font(.largeTitle)
                        
                        Text (String(game.team2TotalScore))
                            .font(.largeTitle)
                        
                    }
                    .font(widthSizeClass == .regular ? .title : .title2)
                    .padding(.bottom, 5)

                    
                    GridRow {
                        Text("Round")
                            .padding(.leading, 3)
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
                    
                    ForEach(Array(zip(game.runningScores.indices, game.runningScores)) , id: \.1) { index, score in
                        
                        GridRow {
                            
                            Text(String(game.runningScores[index].round))
                                .foregroundColor(.black)
                            
                            HStack{
                                Text("(\(String(game.runningScores[index].t1ChangeInScore))) ")
                                
                                Text("\(String(game.runningScores[index].t1Score)) ")
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                            .foregroundColor((index + 1) < game.round ? .black : .clear)
                            .background((index + 1) < game.round ? .blue.opacity(0.3) : .clear)
                            .cornerRadius(8)
                            
                            HStack{
                                Text("(\(String(game.runningScores[index].t2ChangeInScore))) ")
                                    .foregroundColor((index + 1)  < game.round ? .black : .clear)
                                
                                Text("\(String(game.runningScores[index].t2Score)) ")
                                    .fontWeight(.bold)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                            .foregroundColor((index + 1) < game.round ? .black : .clear)
                            .background((index + 1) < game.round ? .gray.opacity(0.3) : .clear)
                            .cornerRadius(8)

                    }// end GridRow
                    .font(widthSizeClass == .regular ? .title2 : .title3)

                        Divider()
                        
                    } // end ForEach
                    
                }
                .padding(.horizontal, 5)
                
                Spacer()
                
                }
            }
        }
    }


#Preview {
    HistoryView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}
