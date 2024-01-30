//
//  WelcomeView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/1/24.
//

import SwiftUI

struct WelcomeView: View {
    
//    @Environment(AppState.self) var appState
    @Binding var game = Game()
    
    var body: some View {
        VStack{
            Spacer()
            Text("Welcome to Sluff Scorecard")
            Spacer()
            
            HStack {
                Menu("Number of players:") {
                    Button("6") {
                        game.numPlayers = 6
                    }
                    Button("8") {
                        game.numPlayers = 8
                    }
                    Button("10") {
                        game.numPlayers = 10
                    }
                    
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environment(AppState())
}
