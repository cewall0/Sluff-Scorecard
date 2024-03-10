//
//  PlayerNameView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 3/9/24.
//

import SwiftUI

struct PlayerNameView: View {
    
    @Environment(Game.self) private var game

    let playerIndex: Int
    
    var body: some View {
        
        @Bindable var game = game

        HStack{
            TextField(game.playersList[playerIndex].name, text: $game.playersList[playerIndex].name)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 4)
                .fontWeight(.bold)
                .accentColor(.pink)
                .foregroundColor(.black)
        }
      
    }
}

//#Preview {
//    PlayerNameView(index: Binding.constant{)
//        .environment(Game())
//}
