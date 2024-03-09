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
    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
//     **** State variable to control if askNumPlayersViewIsOn is shown ****
    @State var askNumPlayersViewIsOn = true
        
    var body: some View {
        
        @Bindable var game = game
            
            VStack{
                
                TitleView()
                
                TeamNameView()
                
                TeamScoresView()

                
                VStack {
                    
                        Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 2) {
                            
                            Divider()

                            ForEach(Array(zip(game.playersList.indices, game.playersList)) , id: \.1) { index, player in
                                ZStack{
                                    HStack{
                                        GridRow {
                                            
                                                Text("   D   ")
                                                    .padding(.vertical, 5)
                                                    .foregroundColor(game.playersList[index].isDealer ? .yellow.opacity(1.0): .yellow.opacity(0.0))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .background(index % 2 == 0 ? .blue.opacity(0.3) : .gray.opacity(0.3))
                                                    .cornerRadius(8)
                                                
                                            
                                        }
                                        .font(widthSizeClass == .regular ? .title : .title2)
                                    } // end HStack
                                    
                                    HStack{
                                        GridRow {
                                            
                                                Text("   D   ")
                                                    .padding(.vertical, 5)
                                                    .foregroundColor(.clear)
                                                
                                                
                                                //                                           PlayerNameView(game: game, playerIndex: player)
                                                
                                                TextField("Enter name", text: $game.playersList[index].name)
                                                    .textFieldStyle(PlainTextFieldStyle())
                                                    .padding(.vertical, 4)
                                                    .fontWeight(.bold)
                                                    .accentColor(.pink)
                                                    .foregroundColor(.black)
                                                
                                            HStack{
                                                Text("Bid:")
                                                
                                                
                                                BidPickerView(playerIndex: index, onBidChanged: {
                                                    game.setTeamBids(from: game.playersList)
                                                    game.checkAllBid()
                                                }
                                                )
                                                .frame(width: 110)
                                                .padding(.trailing, -30)
                                                
                                            }
                                            .frame(width: 150)
                                            .gridColumnAlignment(.trailing)
                                            
                                        }
                                        .font(widthSizeClass == .regular ? .title : .title2)
                                    }
                                      

                                }// end zstack
                                
                                Divider()
                                
                                   } // end ForEach
                            
                               }.padding(.horizontal, 5)
                    

                    Button(action: {
                        game.setSluffOptions()
                        game.resetTricksSluffsWon()
                        router.path.append(2) // case 2 sends to ScoreHandView() See NavigationDestination below
                    }) {
                        Text("Score this hand")
                            .font(widthSizeClass == .regular ? .title : .title2)

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




