//
//  NumPlayersView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

//
//  AddPlayerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

import SwiftUI
import Observation

struct NumPlayersView: View {
    
    @Environment(Game.self) private var game
    
    var body: some View {
        NavigationView() {

                //                Form{
                VStack{
                    Text("")
                    Text("")
                    Text("Welcome to")
                        .font(.largeTitle)
                    Text("Sluff Scorecard")
                        .font(.largeTitle)
                    Text(" ")
                    Text("How many players will be playing?")
                        .font(.title3)
                    Text(" ")
                    Text(" ")
                    
                    NumPlayersPickerView(game: game)
                        .onChange(of: game.numberOfPlayers) {game.setNumberOfPlayers(game.numberOfPlayers)}
                    
                    NavigationLink(destination: ScorecardView()) {
                        Text("Let's go. . .")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(game.numPlayersIsSelected ? .blue.opacity(1.0): .blue.opacity(0.5))
                    .disabled(!game.numPlayersIsSelected)
                    .clipShape(Capsule())
                    .padding()
                    
                    Spacer()
                    
                } // end VStack
            } // end Navigation View
            //        } // end form
        }
    }


#Preview {
    NumPlayersView()
        .environment(Game())
}
