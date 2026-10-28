//
//  WinnerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/15/24.
//

import Foundation
import SwiftUI
import Observation
import StoreKit


struct WinnerView: View {
    
    @Environment(Game.self) private var game
    
    @Binding var path: NavigationPath

    @Environment(\.requestReview) private var requestReview
    @AppStorage("completedGames") private var completedGames = 0
    @State private var countedThisGame = false
    
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
                        Text("Way to go \(game.winner)!!")
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
            .onAppear {
                // Ask for a rating after the 3rd finished game, then every 10th (iOS limits how often it shows)
                guard !countedThisGame else { return }
                countedThisGame = true
                completedGames += 1
                if completedGames == 3 || completedGames % 10 == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { requestReview() }
                }
            }

        
    }
}

#Preview {
    WinnerView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}
