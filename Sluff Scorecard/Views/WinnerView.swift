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
            
            Text("Game Over!").font(.title)
            Text("")
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
                router.path.append(1)
            } label: {
                Text("New Game")
            }.buttonStyle(.borderedProminent)
                .tint(.accentColor)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WinnerView()
        .environment(Game())
}
