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
    @EnvironmentObject var router: Router
    
    let threeColumnGrid = [GridItem(.fixed(80)), GridItem(.fixed(150)), GridItem(.fixed(150))]
//    let threeColumnGrid = [GridItem(.fixed(80)), GridItem(.flexible()), GridItem(.flexible())]


    
    var body: some View {

            
            VStack(alignment: .center){

            Image("color sluff scorecard")
                .resizable()
                .frame(width: 200, height: 80)
            
                Text("")
                Text("")


                LazyVGrid(columns: threeColumnGrid, alignment: .center, spacing: 3) {

                Text("Round")
                        .padding(.leading, 3)
                    .font(.title3)
                    .foregroundColor(.black)
                

                
                Text(game.team1Name)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 2)
                    .font(.title3)
                    .background(.blue.opacity(0.3))
                    .foregroundStyle(.black)
                    .cornerRadius(8)
//                    .padding()


                
                Text(game.team2Name)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 2)
                    .font(.title3)
                    .background(.gray.opacity(0.3))
                    .foregroundStyle(.black)
                    .cornerRadius(8)
//                    .padding()

                

                           
            }

 
            VStack {

                    List {
                        ForEach(game.runningScores.indices, id: \.self) { index in
                            
                            LazyVGrid(columns: threeColumnGrid, alignment: .center, spacing: 3) {

                                Text(String(game.runningScores[index].round))
                                    .font(.title3)
                                    .foregroundColor((index + 1) < game.round ? .black : .clear)
 
                                HStack{
                                    Text("(\(String(game.runningScores[index].t1ChangeInScore))) ")
                                        .font(.title3)
                                        .foregroundColor((index + 1)  < game.round ? .black : .clear)
                                    
                                    Text("\(String(game.runningScores[index].t1Score)) ")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor((index + 1)  < game.round ? .black : .clear)
                                }

                                HStack{
                                    Text("(\(String(game.runningScores[index].t2ChangeInScore))) ")
                                        .font(.title3)
                                        .foregroundColor((index + 1)  < game.round ? .black : .clear)
                                    
                                    Text("\(String(game.runningScores[index].t2Score)) ")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor((index + 1)  < game.round ? .black : .clear)
                                }
                               
                            } // end HStack
                            
                        }
                    }// end List
                    .listStyle(.plain)
                    
                }
            }
    }
}

#Preview {
    HistoryView()
        .environment(Game())
        .environmentObject(Router())
}
