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
            VStack {
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Bid:")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(width: 70)
                                    .padding(.leading, 40)
                                
                                BidPickerView(playerIndex: index, onBidChanged: {
                                    game.setTeamBids(from: game.playersList)
                                    game.checkAllBid()
                                })
                                .frame(maxWidth: 110, alignment: .trailing)
                                .padding(.trailing, 15.0)
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
                        path.append(2) // Navigate to ScoreHandView()
                    }) {
                        Text("Score this hand")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.accentColor)
                    .disabled(game.notAllBid)
                    
                    Spacer() // Push everything above to the top
                }
                
                // BannerAdView is outside of ScrollView to ensure it's at the bottom of the screen
                BannerAdView(adFormat: UIDevice.current.userInterfaceIdiom == .pad ? .leaderboard : .standardBanner, onShow: { print("Show Banner") })
                    .frame(height: 50) // Set appropriate height for the banner
                    .padding(.bottom) // Add padding if needed
            }
            .navigationBarBackButtonHidden(true)
        } else {
            WinnerView(path: $path)
        }
    } // end Body view
} // end struct

#Preview {
    ScorecardView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}
