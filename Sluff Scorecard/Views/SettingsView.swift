//
//  SettingsView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

import SwiftUI
import Observation

struct SettingsView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router
    
    
    var body: some View {
        @Bindable var game = game
        VStack{
            Text("")
            Text("")
            Text("Sluff Scorecard")
                .font(.largeTitle)
            Text("(Settings)")
                .font(.title2)
            Text(" ")
            Text(" ")
            
            VStack(alignment: .leading){
                
                //                    NumPlayersPickerView(game: game)
                //                        .onChange(of: game.numberOfPlayers) {game.setNumberOfPlayers(game.numberOfPlayers)}
                HStack{
                    Text("D").foregroundColor(.yellow)
                    Text("= Current Dealer")
                } // end HStack
                
                Text(" ")
                
                Link("Rules of Sluff (gamesrules.com)", destination: URL(string: "https://gamerules.com/rules/rook-sluff-card-game/")!)
                
                Text(" ")
                HStack{
                    Text("Change the number of players:")
                    
                    //                            Button(action: {
                    //                                self.game.playersList.removeAll()
                    //                                self.game.numberOfPlayers = 6
                    //                                self.game.setNumberOfPlayers()
                    //                            }, label: {
                    //                                Text("6")
                    //                            })
                    //
                    //                            Button(action: {
                    //                                self.game.playersList.removeAll()
                    //                                self.game.numberOfPlayers = 8
                    //                                self.game.setNumberOfPlayers()
                    //                            }, label: {
                    //                                Text("8")
                    //                            })
                    //
                    //                            Button(action: {
                    //                                self.game.playersList.removeAll()
                    //                                self.game.numberOfPlayers = 10
                    //                                self.game.setNumberOfPlayers()
                    //                            }, label: {
                    //                                Text("10")
                    //                            })
                } // end HStack
                
                Text(" ")
                
                Button(action: {
                    router.reset()
                }) {
                    Text("Return")
                } // end button
                
                Spacer()
                
            } // end VStack
        } // end VStack
    } // end View body
} // end struct

#Preview {
    SettingsView()
        .environment(Game())
        .environmentObject(Router())
}
