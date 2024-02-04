//
//  PlayerNameView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/3/24.
//

import SwiftUI

struct PlayerNameView: View {
    
    @Bindable var game: Game
    var playerIndex: Int
    
    var body: some View {
        TextField("Enter name", text: $game.playersList[playerIndex].name)
            .textFieldStyle(PlainTextFieldStyle())
            .accentColor(.pink)
            .foregroundColor(.black)
            .padding(4)
            .background(playerIndex%2 == 0 ? .teal.opacity(0.3) : .gray.opacity(0.3))
            .cornerRadius(8)
    }
}

#Preview {
    PlayerNameView(game: Game(), playerIndex: 0)
}
