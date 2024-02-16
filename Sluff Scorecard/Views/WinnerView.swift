//
//  WinnerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/15/24.
//

import SwiftUI

struct WinnerView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router

    var body: some View {
        @Bindable var game = game
        
        VStack{
            TitleView()

            TeamNameView()
            
            TeamScoresView()
            
            Spacer()
            
            HStack{
                if game.winner == "Tie" {
                    Text("We have a tie!")
                } else {
                    Text("\(game.winner) wins!!")
                }
            }.font(.title)
            
            Spacer()
            
            Button {
                game.resetGame()
                router.reset()
            } label: {
                Text("New Game")
            }.buttonStyle(.borderedProminent)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WinnerView()
        .environment(Game())
}
