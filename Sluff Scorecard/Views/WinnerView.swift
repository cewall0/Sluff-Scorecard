//
//  WinnerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/15/24.
//

import Foundation
import SwiftUI
import Observation


struct WinnerView: View {
    
    @Environment(Game.self) private var game
    
    @Binding var path: NavigationPath
    
    func reset() {
        self.path = NavigationPath()
    }

    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?



    var body: some View {
        @Bindable var game = game
        
        VStack{
            TitleView(path: $path)

            TeamNameView()
            
            TeamScoresView()
            
            VStack{
                Text("Game Over").font(.largeTitle)
                Text("")
                HStack{
                    if game.winner == "Tie" {
                        Text("We have a tie!")
                    } else {
                        Text("\(game.winner) wins!!")
                    }
                }
                .font(.title)
            }
            .padding()
            
            
            Button {
                game.resetGame()
                reset()
                path.append(1)
            } label: {
                Text("New Game")
            }.buttonStyle(.borderedProminent)
                .tint(.accentColor)
                .font(.title)
                .padding()
            
            Spacer()
            
            Spacer()
            
            Spacer()
            
        }.navigationBarBackButtonHidden(true)

        
    }
}

#Preview {
    WinnerView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}
