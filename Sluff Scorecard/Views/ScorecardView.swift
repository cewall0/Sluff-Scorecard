////
////  ScorecardView.swift
////  Sluff Scorecard
////
////  Created by Chad Wallace on 1/1/24.
////
//
import Foundation
import SwiftUI
import Observation

struct ScorecardView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router
    
    // **** State variable to control if askNumPlayersViewIsOn is shown ****
    @State var askNumPlayersViewIsOn = true
    
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        

            
            VStack{
                
                TitleView()
                
                TeamNameView()
                
                TeamScoresView()
                
                VStack {
                    GeometryReader{geo in
                        List {
                            ForEach(game.playersList.indices, id: \.self) { index in
                                HStack {
                                    Text("D")
                                        .frame(width: CGFloat(geo.size.width*0.05))
                                        .fontWeight(.bold)
                                        .padding(.leading, 40.0)
                                        .foregroundColor(game.playersList[index].isDealer ? .yellow.opacity(1.0): .yellow.opacity(0.0))
                                    
                                    PlayerNameView(game: game, playerIndex: index)
                                        .frame(width: CGFloat(geo.size.width*0.5))
                                    
                                    BidPickerView(game: game, playerIndex: index, onBidChanged: {
                                        game.setTeamBids(from: game.playersList)
                                        game.checkAllBid()
                                    }
                                    )
                                    .frame(width: CGFloat(geo.size.width*0.30))
                                    .padding(.trailing, 50.0)
                                } // end HStack
                                .frame(width: CGFloat(geo.size.width*0.95))
                                .foregroundColor(.black.opacity(1.0))
                                .tint(.black)
                                .background(index % 2 == 0 ? .teal.opacity(0.3) : .gray.opacity(0.3))
                                .cornerRadius(8)
                                
                                
                            }
                        }// end List
                        .listStyle(.plain)
                        
                    }
                    
                    Button(action: {
                        game.resetTricksSluffsWon()
                        router.path.append(2) // case 2 sends to ScoreHandView() See NavigationDestination below
                    }) {
                        Text("Score this hand")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.accentColor)
                    .disabled(game.notAllBid)
                    
                    Spacer()
                    
                }

            }.navigationBarBackButtonHidden(true) // end VStack

    } // end Body view
} // end struct


#Preview {
    NavigationStack{
        ScorecardView()
            .environment(Game())
            .environmentObject(Router())
    }
}




