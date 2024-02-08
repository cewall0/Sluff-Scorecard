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
                        
                    NumPlayersPickerView(game: game)
                        .onChange(of: game.numberOfPlayers) {game.setNumberOfPlayers(game.numberOfPlayers)}
                        HStack{
                            Text("D").foregroundColor(.yellow)
                            Text("= Current Dealer")
                        }
                        Text(" ")
                        Link("Rules of Sluff (gamesrules.com)", destination: URL(string: "https://gamerules.com/rules/rook-sluff-card-game/")!)
                        
                        Button(action: {
                            router.reset()
                        }) {
                            Text("Return")
                        }
                        
                    }
                    
                    Spacer()
                    
                } // end VStack
        }
    }


#Preview {
    SettingsView()
        .environment(Game())
}
