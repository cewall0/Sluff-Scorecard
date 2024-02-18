//
//  PlayerNameView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/3/24.
//

import SwiftUI
import Foundation

struct PlayerNameView: View {
    
    @Bindable var game: Game
    var playerIndex: Int
    
    var body: some View {

            HStack{
                TextField("Enter name", text: $game.playersList[playerIndex].name)
                    .textFieldStyle(PlainTextFieldStyle())
                    .fontWeight(.bold)
                    .accentColor(.pink)
                    .foregroundColor(.black)

        }
    }
}

#Preview {
    PlayerNameView(game: Game(), playerIndex: 0)
}
