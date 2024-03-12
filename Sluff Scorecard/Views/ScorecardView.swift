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
    
    @Binding var path: NavigationPath
    
    func reset() {
        self.path = NavigationPath()
    }
    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    
    var body: some View {
        
        @Bindable var game = game
        
        if game.gameOver == false {
            
            VStack{
                
                ScrollView {
                    
                    TitleView(path: $path)
                        .padding(.bottom, -10)
                    
                    RoundView()
                        .padding(.bottom, 10)
                    
                    TeamNameView()
                        .disableAutocorrection(true)
                    
                    TeamScoresView()
                    
                    
                    LazyVStack(spacing: 2) {
                        ForEach(game.playersList.indices, id: \.self) { index in
                            HStack {
                                Text("D")
                                    .fontWeight(.bold)
                                    .padding(.leading, 15.0)
                                    .padding(.trailing, 5)
                                    .foregroundColor(game.playersList[index].isDealer ? .yellow.opacity(1.0): .yellow.opacity(0.0))
                                
                                PlayerNameView(playerIndex: index)
                                    .disableAutocorrection(true)
                                    .frame(maxWidth: .infinity, alignment: .leading) // Ensure player name is left-justified
                                
                                Text("Bid:")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(width: 70) // Fixed width for the "Bid:" label
                                    .padding(.leading, 40)
                                
                                BidPickerView(playerIndex: index, onBidChanged: {
                                    game.setTeamBids(from: game.playersList)
                                    game.checkAllBid()
                                })
                                //                            .scaleEffect(1.1)
                                .frame(maxWidth: 110, alignment: .trailing) // Allow the bid picker to expand
                                .padding(.trailing, 15.0) // Add padding to separate bid picker from label
                            }
                            .font(widthSizeClass == .regular ? .title3 : .headline)
                            .padding(.vertical, 3)
                            .tint(.black)
                            .background(index % 2 == 0 ? Color.blue.opacity(0.3) : Color.gray.opacity(0.3))
                            .cornerRadius(8)
                            .padding(.horizontal, 5)
                        }
                    }
                    
                    Button(action: {
                        game.setSluffOptions()
                        game.resetTricksSluffsWon()
                        path.append(2) // case 2 sends to ScoreHandView() See NavigationDestination below
                    }) {
                        Text("Score this hand")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.accentColor)
                    .disabled(game.notAllBid)
                    
                    Spacer()
                    
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    
                }
            }.navigationBarBackButtonHidden(true)
        }
        else {
            WinnerView(path: $path)
        }
    } // end Body view
} // end struct


#Preview {
    
    ScorecardView(path: Binding.constant(NavigationPath()))
        .environment(Game())
    
}





