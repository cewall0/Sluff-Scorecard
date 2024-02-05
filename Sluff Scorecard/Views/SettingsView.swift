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
    
    var body: some View {
        NavigationView() {

                VStack{
                    Text("")
                    Text("")
                    Text("Sluff Scorecard")
                        .font(.largeTitle)
                    Text(" ")
                    Text("Settings")
                        .font(.title2)
                    Text(" ")
                    Text(" ")
                    
                    NumPlayersPickerView(game: game)
                        .onChange(of: game.numberOfPlayers) {game.setNumberOfPlayers(game.numberOfPlayers)}
                    
                    Spacer()
                    
                } // end VStack
            } // end Navigation View
        }
    }


#Preview {
    SettingsView()
        .environment(Game())
}
