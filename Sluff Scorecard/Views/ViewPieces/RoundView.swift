//
//  RoundView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 3/12/24.
//

import SwiftUI

struct RoundView: View {
    
    @Environment(Game.self) private var game
    
    var body: some View {
        HStack{
            Text("(Round: \(game.round)/\(game.numberOfPlayers))")
        }
    }
}

#Preview {
    RoundView()
}
